require './person'
require './capitalize_decorator'
require './trimmer_decorator'

person = Person.new(22, 'maximilianus')
print("#{person.correct_name}\n")
capitalized_person = CapitalizeDecorator.new(person)
print("#{capitalized_person.correct_name}\n")
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
print("#{capitalized_trimmed_person.correct_name}\n")
