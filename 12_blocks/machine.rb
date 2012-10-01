class Machine
	def do_something(n=1)
		result = nil
		n.times { result = yield }
		result
	end
end