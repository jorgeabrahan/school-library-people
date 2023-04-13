require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals
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

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private
  def is_of_age?
    return true if @age >= 18
    false
  end
end
