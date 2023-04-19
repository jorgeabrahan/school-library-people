require './teacher'
require './student'
require './book'
require './rental'
require './storage'

class App
  attr_accessor :persons, :books, :rentals

  def initialize
    @storage = Storage.new('storage')
    @persons = []
    @books = []
    @rentals = []
  end

  def get_type(person)
    @person&.specialization.nil? ? '[Student]' : '[Teacher]'
  end

  def list_persons(display_num: false)
    # if there are no persons
    return puts "\nERROR:\nThere are no persons created yet!\n\n" if @persons.nil? || @persons.empty?

    puts "Amount of persons #{@persons.length}"
    @persons.each_with_index do |p, index|
      # identify which type to display
      type = get_type(p)
      # identify if it is needed to display the specialization
      specialization = type == '[Teacher]' ? ", Specialization: #{p.specialization}" : ''
      # display each person data
      puts "#{display_num ? "#{index}) " : ''}#{type} ID: #{p.id}, Name: #{p.name}, Age: #{p.age}#{specialization}"
    end
  end

  def list_books(display_num: false)
    # if there are no books
    return puts "\nERROR:\nThere are no books created yet!\n\n" if @books.nil? || @books.empty?

    puts "Amount of books #{@books.length}"
    @books.each_with_index do |b, index|
      # display each book data and the index if necessary
      puts "#{display_num ? "#{index}) " : ''}Title: \"#{b.title}\", Author: #{b.author}"
    end
  end

  def get_person(id)
    # get person from persons array by ID
    person = @persons.find { |p| p.id == id }
    return person unless person.nil? || person&.rentals.nil?

    # if person does not exist returns nil and displays an error message
    puts 'id is not valid!'
    nil
  end

  def list_rentals(id)
    # get person object from id
    person = get_person(id)
    # if person does not exist then do nothing
    return if person.nil?

    # display the amount of rentals
    puts "#{person.name} rentals (#{person&.rentals&.length}):"
    person&.rentals&.each do |r|
      # display rentals information for the entered person
      puts "Date: #{r.date}, Book title: \"#{r.book.title}\", Book author: #{r.book.author}"
    end
  end

  def create_person(age, name = 'Unknown', specialty = nil, parent_permission: true)
    # determine which type of person to insert and insert it
    @persons.push(specialty.nil? ? Student.new(age, name, parent_permission) : Teacher.new(specialty, age, name))
  end

  def create_book(title, author)
    @books.push(Book.new(title, author))
  end

  def create_rental(date, book, person)
    @rentals.push(Rental.new(date, book, person))
  end
end
