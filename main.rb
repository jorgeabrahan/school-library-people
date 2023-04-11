require './person'
require './capitalize_decorator'
require './trimmer_decorator'

person = Person.new(22, 'maximilianus')
print("#{person.correct_name}\n")
capitalizedPerson = CapitalizeDecorator.new(person)
print("#{capitalizedPerson.correct_name}\n")
capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
print("#{capitalizedTrimmedPerson.correct_name}\n")
