require 'spec_helper'

describe Person do
  let(:person){ Person.new }
  describe 'found_friends(people)' do
    let(:people){ ['Don', 'John', 'Kent', 'Sally'] }
    subject{ person.found_friends(people) }
    it{ should == ['Don', 'John', 'Kent'] }
  end
end
