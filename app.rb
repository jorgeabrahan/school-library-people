require './teacher'
require './student'
require './book'
require './rental'

class App
  attr_accessor :persons, :books, :rentals

  def create_person(age, name = "Unknown", parent_permission = true, specialization = nil)
    persons.push(
      specialization != nil ?
      Teacher.new(specialization, age, name) : Student.new(age, name, parent_permission)
    )
  end
  
  def create_boook(title, author)
    books.push(Book.new(title, author))
  end
  
  def create_rental(date, book, person)
    rentals.push(Rental.new(date, book, person))
  end
end