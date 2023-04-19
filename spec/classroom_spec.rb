require 'spec_helper'

describe Classroom do
  describe '#initialize' do
    it 'should set the label and students to an empty array' do
      classroom = Classroom.new('Math')
      expect(classroom.label).to eq('Math')
      expect(classroom.instance_variable_get(:@students)).to eq([])
    end
  end

  describe '#add_student' do
    it 'should add a student to the classroom and set the student\'s classroom' do
      classroom = Classroom.new('Math')
      student = Student.new('John', 'Doe')
      expect(classroom.add_student(student)).to eq([student.attributes])
      expect(student.classroom).to eq(classroom)
    end
  end
end
