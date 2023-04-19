require 'json'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def as_json(_options = {})
    {
      date: @date,
      book_title: @book.title,
      person_id: @person.id
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end
end
