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
    employees.select { |e| e.manager? }
  end

  def self.not_managers(employees)
    employees.reject { |e| e.manager? }
  end

  def self.offices_of_all(employees)
    employees.map { |e| e.office }
  end

  def self.offices_of_managers(employees)
    employees.select { |e| e.manager? }.
              map { |e| e.office }
  end

  def self.total_salary_of_all(employees)
    employees.inject(0) { |sum, e| sum + e.salary }
  end
end
