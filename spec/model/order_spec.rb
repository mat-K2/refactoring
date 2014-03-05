require 'spec_helper'

describe Order do
  let(:amount){ 100 }
  let(:base_price){ 1000 }
  let(:quantity){ nil }
  let(:item_price){ nil }
  let(:order){ Order.new(amount, base_price, quantity, item_price) }
  describe 'over_thousand?' do
    subject{ order.over_thousand? }
    context 'base_price > 1000' do
      let(:base_price){ 1001 }
      it{ should be_true }
    end
    context 'base_price <= 1000' do
      let(:base_price){ 1000 }
      it{ should be_false }
    end
  end

  describe 'price' do
    subject{ order.price }
    context 'base_price > 1000' do
      let(:quantity){ 1 }
      let(:item_price){ 1001 }
      it{ should == 1001 * 0.95 }
    end
    context 'base_price <= 1000' do
      let(:quantity){ 1 }
      let(:item_price){ 1000 }
      it{ should == 1000 * 0.98 }
    end
  end
end
