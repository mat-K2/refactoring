require 'spec_helper'

describe Account do
  let(:type){ 'normal' }
  let(:account_type){ AccountType.new(type) }
  let(:days_overdrawn){ 0 }
  let(:account){ Account.new(account_type, days_overdrawn) }

  describe 'initialize(account_type, days_overdrawn)' do
    it{ account.instance_variable_get(:@account_type).should == account_type }
    it{ account.instance_variable_get(:@days_overdrawn).should == 0 }
  end

  describe 'overdraft_charge' do
    subject{ account.overdraft_charge }
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

  describe 'bank_charge' do
    subject{ account.bank_charge }
    context 'days_overdrawn == 0' do
      it{ should == 4.5 }
    end
    context 'days_overdrawn >= 1' do
      let(:days_overdrawn){ 1 }
      before do
        account.should_receive(:overdraft_charge).and_return(1.75)
      end
      it{ should == 6.25 }
    end
  end
end
