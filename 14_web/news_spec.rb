require 'fakeweb'
require "#{File.dirname(__FILE__)}/news"

describe News do

  before do
    f = File.new("cnn.html", "r")
    FakeWeb.register_uri(:get, "http://www.cnn.com", :body => f.read)
    @news = News.new
  end

  it "should allow you to set the uri" do
    @news.uri = "http://www.cnn.com"
    @news.uri.should == "http://www.cnn.com"
  end

  it "should fetch the page when you set the uri" do
    @news.uri = "http://www.cnn.com"
    @news.source_data.should == File.new("cnn.html", "r").read      
  end

  describe "#top_story" do

    it "should return the first headlines with url listed under 'Latest News'" do
      @news.uri = "http://www.cnn.com"
      @news.top_story.should == 
        {:url => "/2010/WORLD/americas/01/31/haiti.us.airlifts/index.html?hpt=T2",
         :title => "Evacuations of Haitians to U.S. to resume"}
    end
  end

end

