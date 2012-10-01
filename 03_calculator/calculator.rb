class Calculator
  attr_reader :name
  attr_writer :num_calculations

  def initialize(name = "no name")
    @name = name
    @num_calculations = 0
  end

  def num_calculations
    @num_calculations
  end

  def add(a,b)
    @num_calculations += 1
    a + b
  end
  
  def sum(nums)
    nums = [0] if nums.empty?
    nums.inject(:+)
  end

  def multiply(*args)
  	args.flatten.inject(1){|mul, item| item*mul}
  end

  def raise(a,b)
  	pow = 0
  	b.times {pow = a*a}
  	pow
  end

  def factorial(n)
  	multiply(1..n)
  	#(1..n).to_a.inject(1){|fac, v| fac*=v}
  end
end