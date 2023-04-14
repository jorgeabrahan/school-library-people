require './person'

class Student < Person
  attr_reader :classroom
  
  def initialize(age, name = "Unknown", parent_permission = true)
    super(age, name, parent_permission)
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

  def respond_to_missing?(_method_name)
    nil
  end
end
