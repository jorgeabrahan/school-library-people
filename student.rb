require './person'

class Student < Person
  attr_reader :classroom
  
  def initialize(age, name = "Unknown", parent_permission = true, id = rand(100..1000))
    super(age, name, parent_permission, id)
  end
  
  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self
  end
  
  def play_hooky
    "¯\\(ツ)/¯"
  end

  def method_missing(_method)
    nil
  end

  def respond_to_missing?(*)
    nil
  end
end
