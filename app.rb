require './teacher'
require './student'
require './book'
require './rental'

class App
  attr_accessor :persons, :books, :rentals

  def list_persons(display_num = false)
    puts "Amount of persons #{persons.length}"
    persons.each_with_index do |p, index|
      type = p&.specialization != nil ? '[Teacher]' : '[Student]'
      specialization = (type == '[Teacher]') ? ", Specialization: #{p.specialization}" : ""
      num = display_num ? "#{index}) " : ''
      print "#{num}#{type} ID: #{p.id}, Name: #{p.name}, Age: #{p.age}#{specialization}"
    end
  end

  def list_books(display_num = false)
    puts "Amount of books #{books.length}"
    books.each_with_index do |b, index| 
      print "#{display_num ? "#{index}) " : ''}Title: \"#{b.title}\", Author: #{b.author}"
    end
  end

  def list_rentals(id)
    person = persons.find { |p| p.id == id }
    if (person == nil || person&.rentals == nil)
      puts "id is not valid!"
      return
    end
    puts "#{person.name} rentals (#{person&.rentals&.length}):"
    person&.rentals.each { |r|
      print "Date: #{r.date}, Book title: \"#{r.book.title}\", Book author: #{r.book.author}"
    }
  end

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