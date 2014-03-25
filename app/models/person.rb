class Person
  attr_reader :department

  def initialize(department)
    @department = department
  end

  def manager
    @department.manager
  end
end
