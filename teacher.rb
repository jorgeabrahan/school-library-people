require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = "Unknown", parent_permission = true, id = rand(100..1000))
    super(age, name, parent_permission, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
