class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_writer :price
  attr_reader :number_of_late_deliveries

  def initialize(title, price_instance, number_of_late_deliveries=nil)
    @title, @price, @number_of_late_deliveries = title, price_instance, number_of_late_deliveries
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end

  def get_rating
    more_than_five_late_deliveries ? 2 : 1
  end

  def more_than_five_late_deliveries
    @number_of_late_deliveries > 5
  end
end
