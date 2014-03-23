require 'spec_helper'

describe AccountType do
  let(:type){ 'normal' }
  let(:account_type){ AccountType.new(type) }
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
