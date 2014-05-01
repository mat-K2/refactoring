require 'spec_helper'

describe MountainBike do
  let(:instance_params_of_rigid) { {
      :type_code => :rigid,
      :tire_width => 2.5,
      :commission => 0.5,
      :base_price => 10000
    }
  }
  let(:instance_params_of_front_suspension) { {
      :type_code => :front_suspension,
      :tire_width => 3.0,
      :commission => 1.0,
      :base_price => 15000,
      :front_fork_travel => 5,
      :front_suspension_price => 5000
    }
  }
  let(:instance_params_of_full_suspension) { {
      :type_code => :full_suspension,
      :tire_width => 4.0,
      :commission => 1.5,
      :base_price => 20000,
      :front_fork_travel => 5,
      :rear_fork_travel => 8,
      :front_suspension_price => 5000,
      :rear_suspension_price => 8000
    }
  }

  describe 'off_road_ability' do
    subject { mountain_bike.off_road_ability }

    context 'rigid' do
      let(:mountain_bike) { MountainBike.new(instance_params_of_rigid) }
      it { should == 2.5 }
    end
    context 'front_suspension' do
      let(:mountain_bike) { MountainBike.new(instance_params_of_front_suspension) }
      it { should == 13 }
    end
    context 'full_suspension' do
      let(:mountain_bike) { MountainBike.new(instance_params_of_full_suspension) }
      it { should == 38 }
    end
  end

  describe 'price' do
    subject { mountain_bike.price }

    context 'rigid' do
      let(:mountain_bike) { MountainBike.new(instance_params_of_rigid) }
      it { should == 15000 }
    end
    context 'front_suspension' do
      let(:mountain_bike) { MountainBike.new(instance_params_of_front_suspension) }
      it { should == 35000 }
    end
    context 'full_suspension' do
      let(:mountain_bike) { MountainBike.new(instance_params_of_full_suspension) }
      it { should == 63000 }
    end
  end
end
