class TestMethodError < Exception
end

class Test
	attr_accessor :test, :var1
	def initialize
		@var1 = "hello world"
		@test = lambda do
			old_method
			puts @var1
		end
	end

	def old_method
		puts "hello there!"
	end

	def new_method(my_func)
		my_func.call if my_func.respond_to? "call"
	end

	[:name, :title].each do |attr|
		define_method attr do
			puts "You asked for #{attr}"
		end
	end

	# Raise a different error than NoMethodError
	def method_missing(meth, *args, &my_block)
		puts "You called #{meth}, with these arguments: #{args.join(" ")}. I Don't know what that is."
		raise TestMethodError.new
	end

	# define the method on the class
	# The second time that method is called, 
	# it skips the call chain to get to method_missing (faster!).
	def method_missing(meth, *args, &my_block)
		puts "Welcome to Method Missing!"
		self.class.send :define_method, meth do
			puts "Your new method #{meth}"
		end
		self.send(meth)
	end

	def add(a,b,*args)
		result = a+b
		result += args.inject(:+) unless args.empty?
		result
	end

	def hash_args(options)
		puts options[:name]
	end

end