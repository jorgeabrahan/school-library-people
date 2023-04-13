require './app'

# determine if an option is valid (is in range)
def is_option_valid?(option, max, min = 1)
  return not(option > max || option < min)
end

def options_process
  option = 0
  while not(is_option_valid?(option, 7))
    puts "\nWhat do you want to do?"
    puts "1- Create a person"
    puts "2- Create a book"
    puts "3- Create a rental"
    puts "4- List all persons"
    puts "5- List all books"
    puts "6- List all rentals for a given person id"
    puts "7- Exit"
    print "Write the number corresponding to the option you want to choose: "
    option = gets.chomp.to_i
    puts "\nOption is not valid!\n" if not(is_option_valid?(option, 7))
  end
  return option
end

def options_create_person
  option = 0
  while not(is_option_valid?(option, 2))
    puts "\nWhich type of person do you want to create?"
    puts "1- Student"
    puts "2- Teacher"
    print "Write the number corresponding to the option you want to choose: "
    option = gets.chomp.to_i

    puts "\nOption is not valid!\n" if not(is_option_valid?(option, 2))
  end
  return option
end

def get_valid_answer(question, max, min = 1)
  answer = -1
  while not(is_option_valid?(answer, max, min))
    print question
    answer = gets.chomp.to_i
    puts "\nInput is not valid!" if not(is_option_valid?(answer, max, min))
  end
  answer
end

def get_boolean_answer(question)
  answer = ""
  valid_answers = ["y", "Y", "n", "N", "Yes", "No", "YES", "NO"]
  # while answer is not valid
  while not(valid_answer.include?(answer))
    # keep asking and getting answer
    print question
    answer = gets.chomp
    # if it's not valid (answer is not a valid answer from array, display a message)
    puts "\nAnswer is not valid!\n" if not(valid_answer.include?(answer))
  end
  # return answer as boolean (if it starts with "y" is true otherwise it is false)
  return (answer.downcase[0] == "y")
end

def get_not_empty_answer(question)
  answer = ''
  while answer == ''
    print question
    answer = gets.chomp
  end
  answer
end

def get_person_data()
  # types: (1) student, (2) teacher
  type_person = get_valid_option(options_create_person, 2)
  # get common fields between persons
  age = get_valid_answer("Age: ", 120)

  print "Name (leave empty for unknown): "
  name = gets.chomp
  name = "Unknown" if (name == nil || name == '')

  # by default permission is true for teachers
  permission = true
  permission = get_boolean_answer("Has parent permission? [Y/N]: ") if (type_person == 1)

  # by default specialization is nil for student
  specialization = nil
  specialization = get_not_empty_answer("Specialization: ") if (type_person == 2)

  return [age, name, permission, specialization]
end

def get_book_data()
  title = get_not_empty_answer("Title: ")
  author = get_not_empty_answer("Author: ")

  return [title, author]
end

def get_rental_data()
  # validate before creating a rental
  if (app.books.length == 0)
    print "You don't have any books to rent"
    return [nil, nil, nil]
  end
  if (app.persons.length == 0)
    print "There are no persons to rent books"
    return [nil, nil, nil]
  end

  # get selected book
  app.list_books(true)
  book_index = get_valid_answer("Select a book by number: ", app.books.length, 0)
  book = app.books[book_index]

  # get selected person
  app.list_persons(true)
  person_index = get_valid_answer("Select a person by number: ", app.persons.length, 0)
  person = app.persons[person_index]

  date = get_not_empty_answer("Date: ")

  return [date, book, person]
end

def main
  option = 0
  app = App.new

  while option != 7
    option = get_valid_option(options_process, 7)

    case option
    when 1
      # CREATE A PERSON
      age, name, permission, specialization = get_person_data()
      app.create_person(age, name, permission, specialization)
      puts "Person created successfully!"
    when 2
      # CREATE A BOOK
      title, author = get_book_data()
      app.create_book(title, author)
      puts "Book created successfully!"
    when 3
      # CREATE A RENTAL
      date, book, person = get_rental_data()
      return if (date == nil || book == nil || person == nil)
      app.create_rental(date, book, person)
      puts "Rental created successfully!"
    when 4
      # LIST ALL PERSONS
      app.list_persons()
    when 5
      # LIST ALL BOOKS
      app.list_books()
    when 6
      # LIST ALL RENTALS FOR A GIVEN PERSON ID
      print "ID: "
      id = gets.chomp
      app.list_rentals(id)
    else
      # EXIT APP
      puts "\nThanks for using the app!\n"
    end
  end
end

main()
