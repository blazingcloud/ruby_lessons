
begin
  puts "Enter a number:"
  num = gets.to_i
  result = 100 / num

rescue
  puts "Your number didn't work!"
  exit
end
puts "100/#{num} is #{result}"

