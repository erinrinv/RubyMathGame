class MathQuestion
  attr_reader :operands

  def initialize
    @operands = [rand(1..20), rand(1..20)]
  end

  def generate_question
    "What is #{@operands[0]} + #{@operands[1]}?"
  end

  def check_answer(answer)
    answer.to_i == @operands.sum
  end
end
