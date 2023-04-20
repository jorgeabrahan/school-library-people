require 'spec_helper'

describe Solver do
  before :all do
    @solver = Solver.new()
  end
  
  describe '#factorial' do
    it '' do
      
    end
  end

  describe '#reverse' do
    it '' do
      
    end
  end
  
  describe '#fizzbuzz' do
    context 'takes an integer and return fizz, buzz or fizzbuzz depending if' do
      it 'it divisible by 3 return fizz, gets 6 expected fizz' do
        expect(@solver.fizzbuzz(3)).to eq('fizz')
      end
      it 'it divisible by 5 return buzz, gets 10 expected fizz' do
        expect(@solver.fizzbuzz(5)).to eq('buzz')
      end
      it 'it divisible by 3 and 5 return fizzbuzz, gets 15 expected fizz' do
        expect(@solver.fizzbuzz(15)).to eq('fizzbuzz')
      end
    end
  end
end