require 'spec_helper'

describe Haggis do
  let(:primary_force){ 10 }
  let(:secondary_force){ 20 }
  let(:mass){ 2 }
  let(:delay){ 5 }
  let(:haggis){ Haggis.new(primary_force, secondary_force, mass, delay) }
  describe 'distance_traveled(time)' do
    context 'secondary_time <= 0' do
      let(:time){ 5 }
      subject{ haggis.distance_traveled(time) }
      it{ should == 62.5 }
    end
    context 'secondary_time > 0' do
      let(:time){ 6 }
      subject{ haggis.distance_traveled(time) }
      it{ should == 162.5 }
    end
  end
end
