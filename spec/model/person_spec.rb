require 'spec_helper'

describe Person do
  let(:person){ Person.new }

  describe 'manager' do
    let(:department){ Department.new('manager-name') }
    before do
      person.department = department
    end
    subject{ person.department.manager }
    it{ should == 'manager-name' }
  end
end
