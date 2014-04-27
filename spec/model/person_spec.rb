require 'spec_helper'

describe Person do
  let(:kent) { Person.new }

  describe 'courses=' do
    before do
      courses = []
      courses << Course.new("Smalltalk Programming", false)
      courses << Course.new("Appreciating Single Malts", true)
      kent.courses = courses
    end
    it { kent.courses.count.should == 2 }
  end

  describe 'add course' do
    before do
      kent.courses = []
      refactoring = Course.new("Refactoring", true)
      kent.courses << refactoring
      kent.courses << Course.new("Brutal Sarcasm", false)
    end
    it { kent.courses.size.should == 2 }
  end

  describe 'remove course' do
    before do
      refactoring = Course.new("Refactoring", true)
      kent.courses = [refactoring, Course.new("Brutal Sarcasm", false)]
      kent.courses.delete(refactoring)
    end
    it { kent.courses.size.should == 1 }
  end
end
