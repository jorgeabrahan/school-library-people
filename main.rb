require './app'

# determine if an option is valid (is in range)
def option_valid?(option, max, min = 1)
  !((option > max || option < min))
end

def options_process
  option = 0
  until option_valid?(option, 7)
    puts "\nWhat do you want to do?"
    puts '1- Create a person'
    puts '2- Create a book'
    puts '3- Create a rental'
    puts '4- List all persons'
    puts '5- List all books'
    puts '6- List all rentals for a given person id'
    puts '7- Exit'
    print 'Write the number corresponding to the option you want to choose: '
    option = gets.chomp.to_i
    puts "\nOption is not valid!\n" unless option_valid?(option, 7)
  end
  option
end

def options_create_person
  option = 0
  until option_valid?(option, 2)
    puts "\nWhich type of person do you want to create?"
    puts '1- Student'
    puts '2- Teacher'
    print 'Write the number corresponding to the option you want to choose: '
    option = gets.chomp.to_i

    puts "\nOption is not valid!\n" unless option_valid?(option, 2)
  end
  option
end

def get_valid_answer(question, max, min = 1)
  answer = -1
  until option_valid?(answer, max, min)
    print question
    answer = gets.chomp.to_i
    puts "\nInput is not valid!" unless option_valid?(answer, max, min)
  end
  answer
end

def get_boolean_answer(question)
  answer = ''
  valid_answers = %w[y Y n N Yes No YES NO]
  # while answer is not valid
  until valid_answers.include?(answer)
    # keep asking and getting answer
    print question
    answer = gets.chomp
    # if it's not valid (answer is not a valid answer from array, display a message)
    puts "\nAnswer is not valid!\n" unless valid_answers.include?(answer)
  end
  # return answer as boolean (if it starts with "y" is true otherwise it is false)
  (answer.downcase[0] == 'y')
end

def get_not_empty_answer(question)
  answer = ''
  while answer == ''
    print question
    answer = gets.chomp
  end
  answer
end

def person_data()
  # types: (1) student, (2) teacher
  type_person = options_create_person
  # get common fields between persons
  age = get_valid_answer('Age: ', 120)

  print 'Name (leave empty for unknown): '
  name = gets.chomp
  name = 'Unknown' if [nil, ''].include?(name)

  # by default permission is true for teachers
  permission = true
  permission = get_boolean_answer('Has parent permission? [Y/N]: ') if type_person == 1

  # by default specialization is nil for student
  specialization = nil
  specialization = get_not_empty_answer('Specialization: ') if type_person == 2

  [age, name, permission, specialization]
end

def book_data()
  title = get_not_empty_answer('Title: ')
  author = get_not_empty_answer('Author: ')

  [title, author]
end

def rental_data(app)
  # validate before creating a rental
  if app.books.empty?
    puts "\nERROR:\nYou don't have any books to rent\n\n"
    return [nil, nil, nil]
  end
  if app.persons.empty?
    puts "\nERROR:\nThere are no persons to rent books\n\n"
    return [nil, nil, nil]
  end

  # get selected book
  app.list_books(display_num: true)
  book_index = get_valid_answer('Select a book by number: ', app.books.length - 1, 0)
  book = app.books[book_index]

  # get selected person
  app.list_persons(display_num: true)
  person_index = get_valid_answer('Select a person by number: ', app.persons.length - 1, 0)
  person = app.persons[person_index]

  date = get_not_empty_answer('Date: ')

  [date, book, person]
end

def new_person(app)
  age, name, permission, specialization = person_data
  app.create_person(age, name, specialization, parent_permission: permission)
  puts 'Person created successfully!'
end

def new_book(app)
  # CREATE A BOOK
  title, author = book_data
  app.create_book(title, author)
  puts 'Book created successfully!'
end

def new_rental(app)
  date, book, person = rental_data(app)
  if date.nil? || book.nil? || person.nil?
    puts "\nERROR:\nWhile creating the rental one of the supplied values was not valid!\n\n"
    return false
  end
  app.create_rental(date, book, person)
  puts 'Rental created successfully!'
  true
end

def show_persons(app)
  if app.persons.nil?
    puts "\nERROR:\nThere are no persons created yet!\n\n"
    return false
  end
  app.list_persons
  true
end

def show_books(app)
  if app.books.nil?
    puts "\nERROR:\nThere are no books created yet!\n\n"
    return false
  end
  app.list_books
  true
end

def show_rentals(app)
  if app.persons.nil?
    puts "\nERROR:\nThere are no persons created yet!\n\n"
    return false
  end
  print 'ID: '
  id = gets.chomp.to_i
  app.list_rentals(id)
  true
end

def evaluate_cases(option, app)
  case option
  when 1 then new_person(app)
  when 2 then new_book(app)
  when 3 then new_rental(app)
  when 4 then show_persons(app)
  when 5 then show_books(app)
  when 6 then show_rentals(app)
  else puts "\nThanks for using the app!\n"
  end
end

def main
  option = 0
  app = App.new
  while option != 7
    option = options_process
    next unless evaluate_cases(option, app)
  end
end

main
