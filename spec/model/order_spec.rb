require 'spec_helper'

describe Order do
  let(:amount){ 100 }
  let(:quantity){ nil }
  let(:item_price){ nil }
  let(:order){ Order.new(amount, quantity, item_price) }
  describe 'over_thousand?' do
    subject{ order.over_thousand? }
    before do
      order.should_receive(:base_price).and_return(base_price_value)
    end
    context 'base_price > 1000' do
      let(:base_price_value){ 1001 }
      it{ should be_true }
    end
    context 'base_price <= 1000' do
      let(:base_price_value){ 1000 }
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
