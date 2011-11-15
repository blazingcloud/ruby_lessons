class Calculator
  def initialize(name = "no name")
    @num_calculations = 0
    @name = name
  end
  def name
    @name
  end
  def num_calculations
    @num_calculations 
  end
  def add(one,two)
    @num_calculations += 1
    one + two
  end
end
