require 'spec_helper'

describe Client do
  describe 'self.number_of_orders_for(orders, customer)' do
    let(:order_1) { Order.new('customer_1') }
    let(:order_2) { Order.new('customer_1') }
    let(:order_3) { Order.new('customer_2') }
    let(:orders) { [order_1, order_2, order_3] }
    let(:customer) { 'customer_1' }
    subject { Client.number_of_orders_for(orders, customer) }
    it { should == 2 }
  end
end
