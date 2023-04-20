require 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(22, 'Name', parent_permission: true)
    @book = Book.new('Title', 'Author')
  end

  describe '#new' do
    it 'takes three parameters and returns a Person instance' do
      expect(@person).to be_an_instance_of(Person)
    end
  end

  describe '#correct_name' do
    it 'Return the name of the person' do
      expect(@person.correct_name).to eq('Name')
    end
  end

  describe '#can_use_services' do
    it 'Return true if person is older than 18 or have permission, expect true "current age 22"' do
      expect(@person.can_use_services?).to eql(true)
    end
  end

  describe '#add_rental' do
    it 'Create a Rental instance and push the rental into person rentals variable' do
      @person.add_rental('2020-03-14', @book)
      expect(@person.instance_variable_get(:@rentals).length).to eq(1)
    end
  end

  describe '#is_of_age?' do
    it 'Should return true since the person is of age' do
      expect(@person.send(:is_of_age?)).to be_truthy
    end
  end
end
