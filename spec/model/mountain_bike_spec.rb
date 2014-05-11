require "spec_helper"

describe MountainBike do
  let(:rigid_params) { {
      :tire_width => 2.5,
      :commission => 0.5,
      :base_price => 10000,
    }
  }
  let(:front_suspension_params) { {
      :tire_width => 3.0,
      :commission => 1.0,
      :base_price => 15000,
      :front_fork_travel => 5,
      :front_suspension_price => 5000
    }
  }
  let(:full_suspension_params) { {
      :tire_width => 4.0,
      :commission => 1.5,
      :base_price => 20000,
      :front_fork_travel => 5,
      :rear_fork_travel => 8,
      :front_suspension_price => 5000,
      :rear_suspension_price => 8000
    }
  }
  let(:rigid_bike) { MountainBike.new(RigidMountainBike.new(rigid_params)) }

  describe "off_road_ability" do
    subject { rigid_bike.off_road_ability }

    context "rigid" do
      it { should == 2.5 }
    end
    context "front_suspension" do
      before do
        rigid_bike.add_front_suspension(front_suspension_params)
      end
      it { should == 13 }
    end
    context "full_suspension" do
      before do
        rigid_bike.add_front_suspension(front_suspension_params)
        rigid_bike.add_rear_suspension(full_suspension_params)
      end
      it { should == 38 }
    end
  end

  describe "price" do
    subject { rigid_bike.price }

    context "rigid" do
      it { should == 15000 }
    end
    context "front_suspension" do
      before do
        rigid_bike.add_front_suspension(front_suspension_params)
      end
      it { should == 35000 }
    end
    context "full_suspension" do
      before do
        rigid_bike.add_front_suspension(front_suspension_params)
        rigid_bike.add_rear_suspension(full_suspension_params)
      end
      it { should == 63000 }
    end
  end

  describe "add_rear_suspension(params)" do
    subject { rigid_bike.add_rear_suspension(full_suspension_params) }

    context "have front suspension" do
      before do
        rigid_bike.add_front_suspension(front_suspension_params)
      end
      it { should be_kind_of(FullSuspensionMountainBike) }
    end
    context "not have front suspension" do
      specify { expect { subject }.to raise_error(RuntimeError, "You can't add rear suspension unless you have front suspension") }
    end
  end
end
