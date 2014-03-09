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
    let(:base_price){ 1000 }
    let(:quantity_discount){ 0.1 }
    let(:shipping){ 100 }
    before do
      order.should_receive(:base_price).and_return(base_price)
      order.should_receive(:quantity_discount).and_return(quantity_discount)
      order.should_receive(:shipping).and_return(shipping)
    end
    subject{ order.price }

    it{ should == 1099.9 }
  end

  describe 'base_price' do
    let(:quantity){ 500 }
    let(:item_price){ 2 }
    subject{ order.base_price }
    it{ should == 1000 }
  end

  describe 'quantity_discount' do
    let(:item_price){ 2 }
    subject{ order.quantity_discount }
    context 'quantity < 500' do
      let(:quantity){ 499 }
      it{ should == 0.0 }
    end
    context 'quantity == 500' do
      let(:quantity){ 500 }
      it{ should == 0.0 }
    end
    context 'quantity > 500' do
      let(:quantity){ 501 }
      it{ should == 0.1 }
    end
  end

  describe 'shipping' do
    before do
      order.should_receive(:base_price).and_return(base_price)
    end
    subject{ order.shipping }

    context 'base_price < 1000' do
      let(:base_price){ 999 }
      it{ should == 99.9 }
    end
    context 'base_price == 1000' do
      let(:base_price){ 1000 }
      it{ should == 100.0 }
    end
    context 'base_price > 1000' do
      let(:base_price){ 1001 }
      it{ should == 100.0 }
    end
  end

  describe 'discount(input_val, quantity, year_to_date)' do
    subject{ order.discount(input_val, quantity, year_to_date) }
    let(:input_val){ 51 }
    let(:quantity){ 100 }
    let(:year_to_date){ 10000 }
    it{ input_val.should == 51 }
    it{ should == 49 }
  end
end
