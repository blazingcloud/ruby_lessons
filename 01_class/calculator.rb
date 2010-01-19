class Calculator
  def initialize
    @num_calculations = 0
  end
  
  def how_many
    @num_calculations
  end
  
  def describe
    "I am a really neat calculator!"
  end
  
  def add(a, b)
    @num_calculations = @num_calculations + 1
    a + b
  end
end

