require 'spec_helper'

describe Account do
  let(:type){ 'normal' }
  let(:interest_rate){ 0.5 }
  let(:account_type){ AccountType.new(type, interest_rate) }
  let(:days_overdrawn){ 0 }
  let(:account){ Account.new(account_type, days_overdrawn) }

  describe 'initialize(account_type, days_overdrawn)' do
    it{ account.instance_variable_get(:@account_type).should == account_type }
    it{ account.instance_variable_get(:@days_overdrawn).should == 0 }
  end

  describe 'interest_for_amount_days(amount, days)' do
    let(:amount){ 100 }
    let(:days){ 365 }
    subject{ account.interest_for_amount_days(amount, days) }
    it{ should == 50 }
  end

  describe 'bank_charge' do
    subject{ account.bank_charge }
    context 'days_overdrawn == 0' do
      it{ should == 4.5 }
    end
    context 'days_overdrawn >= 1' do
      let(:days_overdrawn){ 1 }
      before do
        account_type.should_receive(:overdraft_charge).with(days_overdrawn).and_return(1.75)
      end
      it{ should == 6.25 }
    end
  end
end
