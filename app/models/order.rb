class Order
  attr_reader :amount
  attr_reader :base_price

  def initialize (amount, base_price)
    @amount = amount
    @base_price = base_price
  end

  def over_thousand?
    self.base_price > 1000
  end
end
