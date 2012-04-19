
def game
  puts "Enter a number:"
  num = gets.to_i
  result = 100 / num
  puts "100/#{num} is #{result}"

rescue
  puts "Your number didn't work!"
  exit
end

game
