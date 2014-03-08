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
    base_price = @quantity * @item_price
    quantity_discount = [0, @quantity - 500].max * @item_price * 0.05
    shipping = [base_price * 0.1, 100.0].min
    return base_price - quantity_discount + shipping
  end

  def base_price
    @quantity * @item_price
  end

  def discount_factor
    base_price > 1000 ? 0.95 : 0.98
  end
end
