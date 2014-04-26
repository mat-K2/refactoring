require 'spec_helper'

describe Customer do
  let(:customer) { Customer.new('john') }

  describe 'add_order' do
    let(:order_1) { Order.new }
    before do
      customer.add_order(order_1)
    end
    it { customer.instance_variable_get("@orders").to_a.should == [order_1] }
    it { order_1.customer.should == customer }
  end
end
