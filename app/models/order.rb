# -*- coding: utf-8 -*-
class Order
  def initialize(customer_name)
    @customer = Customer.create(customer_name)
  end

  def customer_name
    @customer.name
  end

  def customer=(customer_name)
    @customer = Customer.new(customer_name)
  end
end
