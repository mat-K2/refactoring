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
    context 'quantity < 500' do
      let(:quantity){ 499 }
      context 'quantity * item_price * 0.1 < 100.0' do
        let(:item_price){ 2 }
        it{ should == 1097.8 }
      end
      context 'quantity * item_price * 0.1 >= 100.0' do
        let(:item_price){ 3 }
        it{ should == 1597.0 }
      end
    end
    context 'quantity == 500' do
      let(:quantity){ 500 }
      context 'quantity * item_price * 0.1 < 100.0' do
        let(:item_price){ 1 }
        it{ should == 550.0 }
      end
      context 'quantity * item_price * 0.1 >= 100.0' do
        let(:item_price){ 2 }
        it{ should == 1100.0 }
      end
    end
    context 'quantity > 500' do
      let(:quantity){ 501 }
      context 'quantity * item_price * 0.1 < 100.0' do
        let(:item_price){ 1 }
        it{ should == 551.05 }
      end
      context 'quantity * item_price * 0.1 >= 100.0' do
        let(:item_price){ 2 }
        it{ should == 1101.9 }
      end
    end
  end
end
