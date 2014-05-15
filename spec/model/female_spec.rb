require 'spec_helper'

describe Female do
  let(:bree) { Female.new }

  describe 'female?' do
    subject { bree.female? }
    it { should be_true }
  end

  describe 'code' do
    subject { bree.code }
    it { should == 'F' }
  end
end
