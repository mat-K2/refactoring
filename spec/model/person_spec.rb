require 'spec_helper'

describe Person do
  let(:department){ Department.new('manager-name') }
  let(:person){ Person.new(department) }

  describe 'manager' do
    subject{ person.manager }
    it{ should == 'manager-name' }
  end

  describe 'department.manager' do
    subject{ person.department.manager }
    it{ should == 'manager-name' }
  end
end
