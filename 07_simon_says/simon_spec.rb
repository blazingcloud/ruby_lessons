require './simon'

describe Simon do
  
  it "should echo hello" do
    Simon.new.echo("hello").should == "hello"
  end
  
  it "should echo bye" do
    Simon.new.echo("bye").should == "bye"
  end

  it "should shout hello" do
    Simon.new.shout("hello").should == "HELLO"
  end
  
  it "should shout multiple words" do
    Simon.new.shout("hello world").should == "HELLO WORLD"
  end

  it "should repeat" do
    Simon.new.repeat("hello").should == "hello hello"
  end

  it "should repeat a number of times" do
    Simon.new.repeat("hello", 3).should == "hello hello hello"
  end

  it "should return the first letter" do
    Simon.new.start_of_word("hello", 1).should == "h"
  end
  
  it "should return the first two letters" do
    Simon.new.start_of_word("Bob", 2).should == "Bo"
  end

  it "should tell us the first word of 'Hello World' is 'Hello'" do
    Simon.new.first_word("Hello World").should == "Hello"
  end

  it "should tell us the first word of 'oh dear' is 'oh'" do
    Simon.new.first_word("oh dear").should == "oh"
  end
end
