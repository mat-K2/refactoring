require 'spec_helper'

describe Client do
  let(:order_1) { Order.new('customer_1') }
  let(:order_2) { Order.new('customer_1') }
  let(:order_3) { Order.new('customer_2') }
  before do
    Customer.load_customers
  end

  describe "initialize(customer_name)" do
    it{ order_1.instance_variable_get(:@customer).should == order_2.instance_variable_get(:@customer) }
    it{ order_1.instance_variable_get(:@customer).should_not == order_3.instance_variable_get(:@customer) }
  end

  describe 'self.number_of_orders_for(orders, customer)' do
    let(:orders) { [order_1, order_2, order_3] }
    let(:customer) { 'customer_1' }
    subject { Client.number_of_orders_for(orders, customer) }
    it { should == 2 }
  end
end
