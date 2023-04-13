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

def is_option_valid?(option, max, min = 1)
  return (option > max || option < min)
end

def get_valid_option(get_option_func, max)
  option = 0
  while is_option_valid?(option, max)
    option = get_option_func()
    if not(is_option_valid?(option, max)) puts "\nOption is not valid!\n"
  end
  option
end

def main
  option = get_valid_option(options_process, 7)
  until option == 7
    
    option = get_valid_option(options_process, 7)
  end
end

main()
