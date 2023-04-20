require 'spec_helper'

describe Solver do
  describe '#factorial' do
    it '' do
      
    end
  end

  describe '#reverse' do
    it 'returns the reversed word' do
      solver = Solver.new
      expect(solver.reverse('')).to eq('')
      expect(solver.reverse('hello')).to eq('olleh')
      expect(solver.reverse('racecar')).to eq('racecar')
    end
  end
  
  describe '#fizzbuzz' do
    it '' do
      
    end
  end
end