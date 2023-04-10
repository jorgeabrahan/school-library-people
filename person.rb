class Person
  def initialize(age, name = "Unknown", parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
end
