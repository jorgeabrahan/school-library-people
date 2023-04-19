require 'spec_helper'

describe Teacher do
  before :all do
    @teacher = Teacher.new "Software Dev", 35, "Juan"
  end

  describe "#new" do
    it "Should create an instance of the Teacher class" do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it "Should initialize specialization as 'Software Dev'" do
      expect(@teacher.specialization).to eq "Software Dev"
    end

    it "Should initialize age as 35" do
      expect(@teacher.age).to be 35
    end

    it "Should initialize name as Juan" do
      expect(@teacher.name).to eq "Juan"
    end

    it "Should generate a random number as id between 100 and 999 for the teacher" do
      expect(@teacher.id).to be_kind_of Numeric
      expect(@teacher.id).to be_between(100, 999).inclusive
    end
  end
end