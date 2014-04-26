require 'spec_helper'

describe Order do
  let(:order) { Order.new }

  describe 'customer=' do
    let(:customer_1) { Customer.new("john") }
    before do
      order.customer = customer_1
    end
    it { order.customer.should == customer_1 }
    it { customer_1.instance_variable_get("@orders").to_a.should == [order] }
  end
end
