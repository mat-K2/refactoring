require 'spec_helper'

describe Recorder do
  let(:recorder){ Recorder.new }

  describe 'play_for(obj)' do
    let(:command_center){ CommandCenter.new }
    before do
      recorder.record.start('LRMMMMRL')
      recorder.record.stop('LRMMMMRL')
      command_center.should_receive(:start).with('LRMMMMRL').and_return(command_center)
      command_center.should_receive(:stop).with('LRMMMMRL').and_return(command_center)
      recorder.play_for(command_center)
    end
    it{ recorder.record.messages.should == [[:start, ['LRMMMMRL']], [:stop, ['LRMMMMRL']]] }
  end

  describe 'to_s' do
    before do
      recorder.record.start('LRMMMMRL')
      recorder.record.stop('LRMMMMRL')
    end
    subject{ recorder.to_s }
    it{ should == "start(args: [\"LRMMMMRL\"]).stop(args: [\"LRMMMMRL\"])" }
  end
end
