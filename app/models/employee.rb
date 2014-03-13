class Employee
  attr_reader :manager_role, :office, :salary

  def initialize(manager_role, office, salary)
    @manager_role = manager_role
    @office = office
    @salary = salary
  end

  def manager?
    self.manager_role
  end

  def self.managers(employees)
    managers = []
    employees.each do |e|
      managers << e if e.manager?
    end
    managers
  end

  def self.not_managers(employees)
    not_managers = []
    employees.each do |e|
      not_managers << e unless e.manager?
    end
    not_managers
  end

  def self.offices_of_all(employees)
    offices = []
    employees.each { |e| offices << e.office }
    offices
  end

  def self.offices_of_managers(employees)
    managerOffices = []
    employees.each do |e|
      managerOffices << e.office if e.manager?
    end
    managerOffices
  end

  def self.total_salary_of_all(employees)
    total = 0
    employees.each { |e| total += e.salary }
    total
  end
end
