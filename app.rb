require './teacher'
require './student'
require './book'
require './rental'

class App
  attr_accessor :persons, :books, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def list_persons(display_num: false)
    puts "Amount of persons #{persons.length}"
    persons.each_with_index do |p, index|
      type = p&.specialization.nil? ? '[Student]' : '[Teacher]'
      specialization = type == '[Teacher]' ? ", Specialization: #{p.specialization}" : ''
      num = display_num ? "#{index}) " : ''
      puts "#{num}#{type} ID: #{p.id}, Name: #{p.name}, Age: #{p.age}#{specialization}"
    end
  end

  def list_books(display_num: false)
    puts "Amount of books #{books.length}"
    books.each_with_index do |b, index|
      puts "#{display_num ? "#{index}) " : ''}Title: \"#{b.title}\", Author: #{b.author}"
    end
  end

  def list_rentals(id)
    person = get_person(id)
    return if person.nil?

    puts "#{person.name} rentals (#{person&.rentals&.length}):"
    person&.rentals&.each do |r|
      puts "Date: #{r.date}, Book title: \"#{r.book.title}\", Book author: #{r.book.author}"
    end
  end

  def create_person(age, name = 'Unknown', specialty = nil, parent_permission: true)
    p = specialty.nil? ? Student.new(age, name, parent_permission) : Teacher.new(specialty, age, name)
    persons.push(p)
  end

  def create_book(title, author)
    books.push(Book.new(title, author))
  end

  def create_rental(date, book, person)
    rentals.push(Rental.new(date, book, person))
  end

  def get_person(id)
    person = persons.find { |p| p.id == id }
    if person.nil? || person&.rentals.nil?
      puts 'id is not valid!'
      return nil
    end
    person
  end
end
