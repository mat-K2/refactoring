require 'spec_helper'

describe Person do
  let(:person){ Person.new }

  describe 'empty_name?' do
    it{ person.empty_name?.should be_true }
  end
end
