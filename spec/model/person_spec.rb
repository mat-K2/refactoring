require 'spec_helper'

describe Person do
  before do
    @grandmother = Person.new('grandfather', Time.parse('1900/1/1'))
    @mother = Person.new('mother', Time.parse('1930/1/1'), nil, grandmother)
    @mother_dead = Person.new('mother-dead', Time.parse('1935/1/1'), Time.parse('1950/1/1'), grandmother)
    @child_1 = Person.new('child_a', Time.parse('1960/1/1'), nil, mother)
    @child_2 = Person.new('child_a', Time.parse('1964/1/1'), nil, mother_dead)
    @child_3 = Person.new('child_b', Time.parse('1965/1/1'), nil, mother_dead)
  end
  let(:grandmother){ @grandmother }
  let(:mother){ @mother }
  let(:mother_dead){ @mother_dead }
  let(:child_1){ @child_1 }
  let(:child_2){ @child_2 }
  let(:child_3){ @child_3 }

  describe 'number_of_living_descendants' do
    subject{ grandmother.number_of_living_descendants }
    it{ should == 4 }
  end

  describe 'number_of_descendants_named(name)' do
    subject{ grandmother.number_of_descendants_named('child_a') }
    it{ should == 2 }
  end
end
