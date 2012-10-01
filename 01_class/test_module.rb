module Dog
	def name
		raise 'error'
	end
end

class Cat
	include Dog
class Test
	def try_me
		"hi"
	end
end
	def name
		"cat"
	end
end