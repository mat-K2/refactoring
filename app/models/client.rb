class Client
  def self.number_of_orders_for(orders, customer)
    orders.select { |order| order.customer == customer }.size
  end
end
