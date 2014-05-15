require 'spec_helper'

describe Employee do
  let(:employee) { Employee.new }

  describe 'emails' do
    subject { employee.emails }
    it { should == [] }
  end

  describe 'voice_mails' do
    subject { employee.voice_mails }
    it { should == [] }
  end
end
