require 'spec_helper'

describe Haggis do
  let(:primary_force){ 10 }
  let(:secondary_force){ 20 }
  let(:mass){ 2 }
  let(:delay){ 5 }
  let(:time){ 10 }
  let(:haggis){ Haggis.new(primary_force, secondary_force, mass, delay) }

  describe 'distance_traveled(time)' do
    let(:primary_distance_traveled){ 62.5 }
    let(:secondary_distance_traveled){ 2000 }
    before do
      haggis.should_receive(:accelerate_secondary?).with(time).and_return(accelerate_secondary_key)
      haggis.should_receive(:primary_distance_traveled).with(time).and_return(primary_distance_traveled)
    end
    subject{ haggis.distance_traveled(time) }

    context 'not accelerate secondary' do
      let(:accelerate_secondary_key){ false }
      before do
        haggis.should_not_receive(:secondary_distance_traveled)
      end
      it{ should == 62.5 }
    end
    context 'accelerate secondary' do
      let(:accelerate_secondary_key){ true }
      before do
        haggis.should_receive(:secondary_distance_traveled).with(time).and_return(secondary_distance_traveled)
      end
      it{ should == 2062.5 }
    end
  end

  describe 'accelerate_secondary?(time)' do
    before do
      haggis.should_receive(:secondary_time).with(time).and_return(secondary_time)
    end
    subject{ haggis.accelerate_secondary?(time) }
    context 'secondary_time > 0' do
      let(:secondary_time){ 1 }
      it{ should be_true }
    end
    context 'secondary_time <= 0' do
      let(:secondary_time){ 0 }
      it{ should be_false }
    end
  end

  describe 'primary_distance_traveled(time)' do
    subject{ haggis.primary_distance_traveled(time) }
    it{ should == 62.5 }
  end

  describe 'secondary_distance_traveled(time)' do
    subject{ haggis.secondary_distance_traveled(time) }
    it{ should == 2000 }
  end
end
