require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age
  def initialize(age, name = "Unknown", parent_permission = true)
    super()
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    return true if is_of_age? || @parent_permission
    false
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  private
  def is_of_age?
    return true if @age >= 18
    false
  end
end
