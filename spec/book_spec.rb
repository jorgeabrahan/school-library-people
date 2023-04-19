require 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('Title', 'Author')
    @person = Person.new(22, 'Name', parent_permission: true)
  end

  describe '#new' do
    it 'takes two parameters and returns a Book object' do
      expect(@book).to be_an_instance_of(Book)
    end
  end

  describe '#as_json' do
    test_data = {
      title: 'Title',
      author: 'Author'
    }
    it 'take a book instance an return it as json' do
      expect(@book.as_json(@book)).to eq(test_data)
    end
  end

  describe '#add_rental' do
    it 'Create a Rental instance and push the rental into book rentals variable' do
      @book.add_rental('2020-03-14', @person)
      expect(@book.instance_variable_get(:@rentals).length).to eq(1)
    end
  end
end
