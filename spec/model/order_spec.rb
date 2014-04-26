require 'spec_helper'

describe Order do
  let(:order) { Order.new }

  describe 'attr_accessor' do
    let(:customer_1) { Customer.new("john") }
    before do
      order.customer = customer_1
    end
    it { order.customer.should == customer_1 }
  end
end
