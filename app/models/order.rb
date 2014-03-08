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
    # 価格は、基本価格 - 数量割引 + 配送料
    return @quantity * @item_price -
      [0, @quantity - 500].max * @item_price * 0.05 +
      [@quantity * @item_price * 0.1, 100.0].min
  end

  def base_price
    @quantity * @item_price
  end

  def discount_factor
    base_price > 1000 ? 0.95 : 0.98
  end
end
