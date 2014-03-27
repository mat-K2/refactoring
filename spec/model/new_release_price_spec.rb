require 'spec_helper'

describe NewReleasePrice do
  let(:new_release_price){ NewReleasePrice.new }

  describe 'charge(days_rented)' do
    subject{ new_release_price.charge(3) }
    it{ should == 9 }
  end
end
