require 'net/http'

class News
  attr_accessor :uri
  attr_accessor :source_data
  
  def uri=(uri)
    @uri = uri
    @source_data = Net::HTTP.get(URI.parse(uri))
  end
  
  def top_story
    m = @source_data.match(/<h4>Latest news<\/h4>.*?<a.*?href="([^"]*)".*?>([^<]+)/)
    { :url => m[1], :title => m[2].strip }
  end
end
