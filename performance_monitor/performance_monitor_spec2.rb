require './performance_monitor.rb'
describe PerformanceMonitor do 

	it "should report the time difference" do
		Time.stub(:now).and_return(0,3)
		time_difference = PerformanceMonitor.new.execute_code do
		end
		time_difference.should be_within(0.1).of(3.0)
	end

	it "should run our code" do
		flag = false
		PerformanceMonitor.new.execute_code do
			flag = true
		end
		flag.should be_true
	end

end