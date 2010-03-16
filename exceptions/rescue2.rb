puts "Enter a number:"
num = gets.to_i

begin
  result = 100 / num

rescue => e
  puts "Your number didn't work... " + e.message
  puts "   Exception class = #{e.class}"
  exit
end
puts "100/#{num} is #{result}"

