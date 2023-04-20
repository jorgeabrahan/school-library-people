require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
    @person = Person.new(22, 'Name', parent_permission: true)

    @mock_book = {
      title: 'Title',
      author: 'Author'
    }
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

  describe '#as_json' do
    it 'take a book instance an return it as json' do
      expect(@book.as_json(@book)).to eq(@mock_book)
    end
  end

  describe '#to_json' do
    it 'Should convert the book data to JSON format' do
      expect(@book.to_json).to eq @mock_book.to_json
    end
  end

  describe '#add_rental' do
    it 'Create a Rental instance and push the rental into book rentals variable' do
      @book.add_rental('2020-03-14', @person)
      expect(@book.instance_variable_get(:@rentals).length).to eq(1)
    end
  end
end
