require 'spec_helper'

describe CommandCenter do
  let(:command_center){ CommandCenter.new }

  describe 'start(command_string' do
    subject{ command_center.start('string') }
    it{ should == command_center }
  end

  describe 'stop(command_string' do
    subject{ command_center.stop('string') }
    it{ should == command_center }
  end
end
