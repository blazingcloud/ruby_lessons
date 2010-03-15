class Calculator
  attr_reader :num_calculations
  attr_accessor :name

  @@num_calculators = 0

  def initialize
    @num_calculations = 0
    @name = "I am a really neat calculator!"
    @@num_calculators += 1
  end
  
  def self.num_calculators
    @@num_calculators
  end
  
  def add(a, b)
    @num_calculations = @num_calculations + 1
    a + b
  end
end

