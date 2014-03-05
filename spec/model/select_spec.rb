require 'spec_helper'

describe Select do
  let(:select){ Select.new }
  describe 'add_option(arg)' do
    subject{ Select.with_option(1999).and(2000).and(2001).and(2002) }
    it{ subject.options.should == [1999, 2000, 2001, 2002] }
  end
end
