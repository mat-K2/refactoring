require 'spec_helper'

describe PostData do
  let(:post_data_val){ {
      :params => 'params-data',
      :session => 'session-data',
      :date => 'date-data'
    }
  }
  let(:post_data){ PostData.new(post_data_val) }

  describe 'params' do
    subject{ post_data.params }
    it{ should == 'params-data' }
  end

  describe 'session' do
    subject{ post_data.session }
    it{ should == 'session-data' }
  end

  describe 'date' do
    subject{ post_data.date }
    it{ should == 'date-data' }
  end
end
