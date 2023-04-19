require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals
  def initialize(age, name = "Unknown", parent_permission = true, id = rand(100..1000))
    super()
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    (is_of_age? || @parent_permission)
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private
  def is_of_age?
    @age >= 18
  end
end
