require 'spec_helper'

describe Student do
  before :all do
    @student = Student.new 20, "Jorge"
  end

  describe "#new" do
    it "Should create an instance of the Student class" do
      expect(@student).to be_an_instance_of Student
    end

    it "Should initialize age as 20" do
      expect(@student.age).to be 20
    end

    it "Should initialize name as Jorge" do
      expect(@student.name).to eq "Jorge"
    end

    it "Should generate a random number as id between 100 and 999 for the student" do
      expect(@student.id).to be_kind_of Numeric
      expect(@student.id).to be_between(100, 999).inclusive
    end
  end

  describe "#as_json" do
    it "Should convert the student data to JSON" do
      mock_student = {
        id: @student.id,
        name: "Jorge",
        age: 20,
        parent_permission: true,
        specialization: nil
      }
      expect(@student.to_json).to eq mock_student.to_json
    end
  end

  describe "#classroom_setter" do
    it "Should add the student to a classroom" do
      @student.classroom = Classroom.new "Programming"
      expect(@student.classroom.label).to eq "Programming"
    end
  end

  describe "#play_hooky" do
    it "Should return a string" do
      expect(@student.play_hooky).to eq "¯\\(ツ)/¯"
    end
  end
end