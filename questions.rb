class Questions
  attr_accessor :question, :num1, :num2

  def initialize(num1, num2)
    @question = "What does #{num1} plus #{num2} equal?"
    @num1 = num1
    @num2 = num2
  end

  def answer()
    self.num1 + self.num2
  end
end