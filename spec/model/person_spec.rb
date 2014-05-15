require 'spec_helper'

describe Person do
  let(:bree) { Person.create_female }

  describe 'female?' do
    subject { bree.female? }
    it { should be_true }
  end

  describe 'code' do
    subject { bree.code }
    it { should == 'F' }
  end
end
