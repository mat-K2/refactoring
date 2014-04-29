require 'spec_helper'

describe Person do
  let(:kent) { Person.new }

  describe 'initialize_courses(courses)' do
    before do
      @courses = []
      @courses << Course.new("Smalltalk Programming", false)
      @courses << Course.new("Appreciating Single Malts", true)
    end
    context 'courses is empty' do
      before do
        kent.initialize_courses(@courses)
      end
      it { kent.courses.count.should == 2 }
    end
    context 'courses is present' do
      before do
        kent.add_course(Course.new("Lisp Programming", false))
      end
      specify { expect { kent.initialize_courses(@courses) }.to raise_error(RuntimeError, "Courses should be empty") }
    end
  end

  describe 'add course' do
    before do
      kent.add_course(Course.new("Refactoring", true))
      kent.add_course(Course.new("Brutal Sarcasm", false))
    end
    it { kent.courses.size.should == 2 }
  end

  describe 'remove course' do
    before do
      refactoring = Course.new("Refactoring", true)
      kent.initialize_courses([refactoring, Course.new("Brutal Sarcasm", false)])
      kent.remove_course(refactoring)
    end
    it { kent.courses.size.should == 1 }
  end
end
