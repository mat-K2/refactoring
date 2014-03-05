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
    base_price * discount_factor
  end

  def base_price
    @quantity * @item_price
  end

  def discount_factor
    base_price > 1000 ? 0.95 : 0.98
  end
end
