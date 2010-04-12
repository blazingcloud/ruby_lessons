require "#{File.dirname(__FILE__)}/hello"

describe Hello do
  it "says hello" do
    h = Hello.new
    h.message.should == "hello"
  end
end
