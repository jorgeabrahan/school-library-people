require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = "Unknown", parent_permission = true, id = rand(100..1000))
    super(age, name, parent_permission, id)
    @specialization = specialization
  end

  def as_json(_options = {})
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      specialization: @specialization
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def can_use_services?
    true
  end
end
