require './app'

def options_process
  puts "What do you want to do?"
  puts "1- Create a person"
  puts "2- Create a book"
  puts "3- Create a rental"
  puts "4- List all persons"
  puts "5- List all books"
  puts "6- List all rentals for a given person id"
  puts "7- Exit"
  print "Write the number corresponding to the option you want to choose: "
  option = gets.chomp.to_i
end

def options_create_person
  puts "Which type of person do you want to create?"
  puts "1- Student"
  puts "2- Teacher"
  print "Write the number corresponding to the option you want to choose: "
  option = gets.chomp.to_i
end

# determine if an option is valid (is in range)
def is_option_valid?(option, max, min = 1)
  return (option > max || option < min)
end

# calls a function that gets an option while the option is not valid (not in range)
def get_valid_option(get_option_func, max)
  option = 0
  while is_option_valid?(option, max)
    # keep asking for option while is not valid
    option = get_option_func()
    # if it's not valid (it's not in valid range), display a message
    puts "\nOption is not valid!\n" if not(is_option_valid?(option, max))
  end
  option
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
  print "Age: "
  age = gets.chomp

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

def main
  option = 0
  app = App.new

  until option == 7
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
    when 4
      # LIST ALL PERSONS
    when 5
      # LIST ALL BOOKS
    when 6
      # LIST ALL RENTALS FOR A GIVEN PERSON ID
    else
      # EXIT APP
      puts "\nThanks for using the app!\n"
    end
  end
end

main()
