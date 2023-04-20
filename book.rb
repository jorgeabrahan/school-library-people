class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def as_json(_options = {})
    {
      title: @title,
      author: @author
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
