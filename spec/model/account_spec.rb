require 'spec_helper'

describe Account do
  let(:account){ Account.new }
  describe 'gamma(input_val, quantity, year_to_date)' do
    let(:input_val){ 1 }
    let(:quantity){ 2 }
    subject{ account.gamma(input_val, quantity, year_to_date) }
    context '(year_to_date - important_value1) <= 100' do
      let(:year_to_date){ 112 }
      it{ should == 1460 }
    end
    context '(year_to_date - important_value1) > 100' do
      let(:year_to_date){ 113 }
      it{ should == 1327 }
    end
  end
end
