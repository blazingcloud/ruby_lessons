class NamedThing
  attr_accessor :name
  def initialize
    @name = "new thing"
  end
end



class Calculator < NamedThing
  attr_reader :num_calculations

  def initialize
    @name = "Cool Calculator"
    @num_calculations = 0
    puts "this is being created"
  end

  def add(a,b,c=0)
    @num_calculations += 1
    total = a + b + c
    puts "I just added up " + total.to_s
    total
  end
end
