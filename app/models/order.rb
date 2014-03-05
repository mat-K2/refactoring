class Order
  attr_reader :amount
  attr_reader :base_price
  attr_accessor :quantity
  attr_accessor :item_price

  def initialize (amount, base_price, quantity=nil, item_price=nil)
    @amount = amount
    @base_price = base_price
    @quantity = quantity
    @item_price = item_price
  end

  def over_thousand?
    self.base_price > 1000
  end

  def price
    base_price = @quantity * @item_price

    if base_price > 1000
      discount_factor = 0.95
    else
      discount_factor = 0.98
    end
    base_price * discount_factor
  end
end
