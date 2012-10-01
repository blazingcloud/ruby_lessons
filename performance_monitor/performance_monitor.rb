class PerformanceMonitor
	def execute_code
		start_time = Time.now
		yield
		end_time = Time.now
		end_time - start_time
	end
end