require 'spec_helper'

describe Recorder do
  let(:recorder){ Recorder.new }
  describe 'method_missing(sym, *args)' do
    before do
      recorder.no_method('arg1', 'arg2')
    end
    it{ recorder.messages.should == [[:no_method, ['arg1', 'arg2']]] }
  end

  describe 'play_for(obj)' do
    let(:command_center){ CommandCenter.new }
    before do
      recorder.start('LRMMMMRL')
      recorder.stop('LRMMMMRL')
      command_center.should_receive(:start).with('LRMMMMRL').and_return(command_center)
      command_center.should_receive(:stop).with('LRMMMMRL').and_return(command_center)
      recorder.play_for(command_center)
    end
    it{ recorder.messages.should == [[:start, ['LRMMMMRL']], [:stop, ['LRMMMMRL']]] }
  end

  describe 'to_s' do
    before do
      recorder.start('LRMMMMRL')
      recorder.stop('LRMMMMRL')
    end
    subject{ recorder.to_s }
    it{ should == "start(args: [\"LRMMMMRL\"]).stop(args: [\"LRMMMMRL\"])" }
  end
end
