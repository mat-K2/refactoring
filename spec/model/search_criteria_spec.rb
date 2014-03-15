require 'spec_helper'

describe SearchCriteria do
  let(:hash){ {
      :author_id => 1,
      :publisher_id => 2,
      :isbn => 123456
    }}
  let(:search_criteria){ SearchCriteria.new(hash) }

  describe 'initialize(hash)' do
    it{ search_criteria.instance_variable_get(:@author_id).should == 1 }
    it{ search_criteria.instance_variable_get(:@publisher_id).should == 2 }
    it{ search_criteria.instance_variable_get(:@isbn).should == 123456 }
  end
end
