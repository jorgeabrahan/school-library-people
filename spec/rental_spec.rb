require 'spec_helper'

describe Rental do
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:person) { Person.new('John', 'Doe', 'johndoe@example.com') }

  describe '#initialize' do
    it 'should set the date, book, and person and add the rental to the book and person' do
      rental = Rental.new('2023-04-19', book, person)
      expect(rental.date).to eq('2023-04-19')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(book.rentals).to eq([rental])
      expect(person.rentals).to eq([rental])
    end
  end

  describe '#as_json' do
    it 'should return a hash with the date, book title, and person id' do
      rental = Rental.new('2023-04-19', book, person)
      expect(rental.as_json).to eq({
                                     date: '2023-04-19',
                                     book_title: 'The Great Gatsby',
                                     person_id: person.id
                                   })
    end
  end

  describe '#to_json' do
    it 'should return a JSON string with the date, book title, and person id' do
      rental = Rental.new('2023-04-19', book, person)
      expect(rental.to_json).to eq({
        date: rental.date,
        book_title: rental.book.title,
        person_id: rental.person.id
      }.to_json)      
    end
  end
end
