module Speaker
	@@klass_var = 20
	FUN = 10
	def name
		"One"
	end
end

module Name
	def name
		"Two"
	end
end

class Dog
	include Speaker
	include Name
	FUN = 8

	def put_fun
		puts @@klass_var
	end
end

class Cat
	include Speaker
	def put_fun
		puts FUN
	end
end