require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    output_correct_name = @nameable.correct_name
    return output_correct_name[0, 11] if output_correct_name.length > 10

    output_correct_name
  end
end
