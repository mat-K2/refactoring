class Person
  attr_reader :name

  def initialize
    @office_telephone = TelephoneNumber.new
  end

  def telephone_number
    office_telephone.telephone_number
  end

  def office_telephone
    @office_telephone
  end
end
