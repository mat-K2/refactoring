require 'spec_helper'

describe Gamma do
  let(:account_obj){ Account.new }
  let(:input_val_arg){ 1 }
  let(:quantity_arg){ 2 }
  let(:year_to_date_arg){ 100 }
  let(:gamma){ Gamma.new(account_obj, input_val_arg, quantity_arg, year_to_date_arg) }

  describe 'initialize(account, input_val_arg, quantity_arg, year_to_date_arg)' do
    it{ gamma.account.should == account_obj }
    it{ gamma.input_val.should == input_val_arg }
    it{ gamma.quantity.should == quantity_arg }
    it{ gamma.year_to_date.should == year_to_date_arg }
  end

  describe 'compute' do
    subject{ gamma.compute }

    context '(year_to_date - important_value1) <= 100' do
      let(:year_to_date_arg){ 112 }
      it{ should == 1460 }
    end
    context '(year_to_date - important_value1) > 100' do
      let(:year_to_date_arg){ 113 }
      it{ should == 1327 }
    end
  end
end
