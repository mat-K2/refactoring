require 'spec_helper'

describe MessageCollector do
  let(:message_collector){ MessageCollector.new }

  describe 'method_missing(sym, *args)' do
    before do
      message_collector.no_method('arg1', 'arg2')
    end
    it{ message_collector.messages.should == [[:no_method, ['arg1', 'arg2']]] }
  end
end
