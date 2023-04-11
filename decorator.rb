require './nameable'

class Decorator < Nameable
  def initialize()
    @nameable = Nameable.new
  end 

end
