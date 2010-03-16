
class StrangeNumberException < Exception
end

def do_some_math(num)
  raise ArgumentError, "number too large" if num > 1000 
  raise StrangeNumberException, "strange number" if num == 998

  result = 100 / num

  puts "100/#{num} is #{result}"
end

puts "Enter a number:"
num = gets.to_i
begin
  do_some_math(num)

#rescue => e
#    puts "Your number didn't work... " + e.message
#    puts "   Exception class = #{e.class}"
rescue StrangeNumberException
    puts "Your number is strange"
ensure
  puts "bye"
end



