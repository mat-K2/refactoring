require 'spec_helper'

describe Item do
  let(:base_price){ 100 }
  let(:tax_rate){ 0.05 }
  let(:item){ Item.new(base_price, tax_rate) }

  describe 'raise_base_price_by(percent)' do
    let(:percent){ 0.1 }
    subject{ item.raise_base_price_by(percent) }
    it{ should == 100.1 }
  end

  describe 'total' do
    subject{ item.total }
    it{ should == 105 }
  end
end
