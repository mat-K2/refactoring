# -*- coding: utf-8 -*-
class Order
  attr_reader :amount
  attr_accessor :quantity
  attr_accessor :item_price

  def initialize (amount, quantity=nil, item_price=nil)
    @amount = amount
    @quantity = quantity
    @item_price = item_price
  end

  def over_thousand?
    self.base_price > 1000
  end

  def price
    return base_price - quantity_discount + shipping
  end

  def base_price
    @quantity * @item_price
  end

  def quantity_discount
    [0, @quantity - 500].max * @item_price * 0.05
  end

  def shipping
    [base_price * 0.1, 100.0].min
  end

  def discount_factor
    base_price > 1000 ? 0.95 : 0.98
  end

  def discount(input_val, quantity, year_to_date)
    result = input_val
    result -= 2 if input_val > 50
    result -= 1 if quantity > 100
    result -= 4 if year_to_date > 10000
    result
  end
end
