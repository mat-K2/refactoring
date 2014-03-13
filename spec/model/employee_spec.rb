require 'spec_helper'

describe Employee do
  let(:employee_1){ Employee.new(false, 'CompanyA', 10) }
  let(:employee_2){ Employee.new(false, 'CompanyB', 20) }
  let(:manager_1){ Employee.new(true, 'CompanyC', 30) }
  let(:manager_2){ Employee.new(true, 'CompanyD', 40) }
  let(:employees){ [employee_1, employee_2, manager_1, manager_2] }

  describe 'self.managers(employees)' do
    subject{ Employee.managers(employees) }
    it{ should == [manager_1, manager_2] }
  end

  describe 'self.not_managers(employees)' do
    subject{ Employee.not_managers(employees) }
    it{ should == [employee_1, employee_2] }
  end

  describe 'self.offices_of_all(employees)' do
    subject{ Employee.offices_of_all(employees) }
    it{ should == ['CompanyA', 'CompanyB', 'CompanyC', 'CompanyD'] }
  end

  describe 'self.offices_of_managers(employees)' do
    subject{ Employee.offices_of_managers(employees) }
    it{ should == ['CompanyC', 'CompanyD'] }
  end

  describe 'self.total_salary_of_all(employees)' do
    subject{ Employee.total_salary_of_all(employees) }
    it{ should == 100 }
  end
end
