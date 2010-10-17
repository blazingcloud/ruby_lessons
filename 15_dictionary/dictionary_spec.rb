require 'dictionary'

describe Dictionary do
  before do
    @d = Dictionary.new
  end
  
  it "should be empty when created" do
    @d.words.should == []
  end

  it "should not include a word in an empty dictionary" do
    @d.include?('fish').should be_false
  end

  it "should not find a word in an empty dictionary" do
    @d.find('fi').should == []
  end

  it "should return true when a word is added" do
    @d.add('fish').should be_true
  end

  it "should only consider non-empty strings as words" do
    @d.add('').should be_false
    @d.add(nil).should be_false
    @d.add(3).should be_false
    @d.add({}).should be_false
  end

  it "should be able to add a word and check for inclusion" do
    @d.add('fish')
    @d.include?('fish').should be_true
  end

  it "should report its contents" do 
    @d.add("fish")
    @d.add("foul")
    @d.words.sort.should == ["fish", "foul"].sort
  end

  it "should report its contents even if one word is a substring of another" do 
    @d.add("cat")
    @d.add("finger")
    @d.add("fin")
    @d.words.sort.should == ["cat", "fin", "finger"].sort
  end

  it "should be able to add words in any order" do 
    @d.add("fin")
    @d.add("cat")
    @d.add("finger")
    @d.words.sort.should == ["cat", "fin", "finger"].sort
  end

  it "include? should test for whole words" do
    @d.add('fishy')
    @d.include?('fish').should be_false
  end

  it "should find nothing if the prefix matches nothing" do
    @d.add('fiend')
    @d.add('great')
    @d.find('nothing').should == []
  end

  it "should find a word from a prefix" do
    @d.add('fish')
    @d.add('fiend')
    @d.add('great')
    @d.find('gr').should == ['great']
  end

  it "should find multiple matches from a prefix" do
    @d.add('fish')
    @d.add('fiend')
    @d.add('great')
    @d.find('fi').sort.should == ['fish', 'fiend'].sort
  end
  
  it "should find correct matches and disregard partial matches" do
    @d.add('fan')
    @d.add('fish')
    @d.add('fishy')
    @d.add('fiend')
    @d.add('great')
    @d.find('fi').sort.should == ['fish', 'fishy', 'fiend'].sort
  end
  
  it "should find correct matches even if one word is a substring of another" do
    @d.add('fishy')
    @d.add('fish')
    @d.find('fi').sort.should == ['fish', 'fishy'].sort
  end
  
end

