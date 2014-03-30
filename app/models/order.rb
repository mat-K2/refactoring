# -*- coding: utf-8 -*-
class Order
  def initialize(customer)
    @customer = Customer.new(customer)
  end

  def customer_name
    @customer.name
  end

  def customer=(value)
    @customer = Customer.new(value)
  end
end
