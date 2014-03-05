require 'spec_helper'

describe Select do
  let(:select){ Select.new }
  describe 'add_option(arg)' do
    before do
      select.add_option(1999)
      select.add_option(2000)
      select.add_option(2001)
      select.add_option(2002)
    end
    it{ select.options.should == [1999, 2000, 2001, 2002] }
  end
end
