require 'spec_helper'

describe Person do
  before do
    class EmployeeNumberGenerator; end
  end
  let(:person){ Person.new }

  describe 'initialize' do
    before do
      EmployeeNumberGenerator.stub(:next).and_return(1)
    end
    it{ person.emails.should == [] }
    it{ person.employee_number.should == 1 }
  end
end
