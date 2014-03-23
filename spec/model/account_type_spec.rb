require 'spec_helper'

describe AccountType do
  let(:type){ 'normal' }
  let(:interest_rate){ 0.5 }
  let(:account_type){ AccountType.new(type, interest_rate) }

  describe 'initialize(type, interest_rate)' do
    it{ account_type.instance_variable_get(:@type).should == 'normal' }
    it{ account_type.instance_variable_get(:@interest_rate).should == 0.5 }
  end

  describe 'overdraft_charge(days_overdrawn)' do
    subject{ account_type.overdraft_charge(days_overdrawn) }
    context 'acccount_type is premium' do
      let(:type){ 'premium' }
      context 'days_overdrawn <= 7' do
        let(:days_overdrawn){ 7 }
        it{ should == 10 }
      end
      context 'days_overdrawn >= 8' do
        let(:days_overdrawn){ 8 }
        it{ should == 10.85 }
      end
    end
    context 'account_type is not premium' do
      let(:type){ 'normal' }
      let(:days_overdrawn){ 10 }
      it{ should == 17.5 }
    end
  end
end
