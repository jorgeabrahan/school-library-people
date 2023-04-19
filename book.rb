class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def as_json(options={})
    {
      title: @title,
      author: @author,
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
