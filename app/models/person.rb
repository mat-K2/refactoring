class Person
  extend Forwardable

  def_delegator :@department, :manager

  attr_accessor :department
end
