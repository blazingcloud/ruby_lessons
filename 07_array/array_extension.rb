
class Array
  def sum
    self.inject(0) do |sum, num| 
      puts "sum:#{sum}, num:#{num}"
      sum + num 
  end
end
