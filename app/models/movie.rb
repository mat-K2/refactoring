class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_writer :price

  def initialize(title, price_instance)
    @title, @price = title, price_instance
  end

  def charge(days_rented)
    @price.charge(days_rented)
  end

  def frequent_renter_points(days_rented)
    @price.frequent_renter_points(days_rented)
  end
end
