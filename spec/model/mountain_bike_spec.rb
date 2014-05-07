require 'spec_helper'

describe MountainBike do
  let(:instance_params) { {
      :type_code => :rigid,
      :tire_width => 2.5,
      :commission => 0.5,
      :base_price => 10000,
      :front_fork_travel => 5,
      :rear_fork_travel => 8,
      :front_suspension_price => 5000,
      :rear_suspension_price => 8000
    }
  }
  let(:mountain_bike) { MountainBike.new(instance_params) }

  describe 'off_road_ability' do
    subject { mountain_bike.off_road_ability }

    context 'rigid' do
      it { should == 2.5 }
    end
    context 'front_suspension' do
      before do
        mountain_bike.type_code = :front_suspension
      end
      it { should == 12.5 }
    end
    context 'full_suspension' do
      before do
        mountain_bike.type_code = :full_suspension
      end
      it { should == 36.5 }
    end
  end

  describe 'price' do
    subject { mountain_bike.price }

    context 'rigid' do
      it { should == 15000 }
    end
    context 'front_suspension' do
      before do
        mountain_bike.type_code = :front_suspension
      end
      it { should == 20000 }
    end
    context 'full_suspension' do
      before do
        mountain_bike.type_code = :full_suspension
      end
      it { should == 28000 }
    end
  end
end
