require 'spec_helper'

describe ProductCountItem do
  let(:search_criteria){ SearchCriteria.new({ :author_id => 1, :publisher_id => 2, :isbn => 123456 }) }
  let(:product_count_items){ ProductCountItem.new }
  describe 'product_count_items(search_criteria=nil)' do
    let(:find_result){ [{ 'id' => 1 }] }
    before do
      ProductCountItem.should_receive(:find_all_by_criteria).with(search_criteria).and_return(find_result)
    end
    subject{ product_count_items.product_count_items(search_criteria) }
    it{ should == [{ 'id' => 1 }] }
  end
end
