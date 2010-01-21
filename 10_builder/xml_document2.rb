class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @level = 0
  end
  def method_missing(tag_name, *args, &block)
    attrs = args[0]
    attrs = {} if attrs.nil?
    result = "<#{tag_name}"
    attrs.each do |key, value|
      result = "#{result} #{key}='#{value}'"
    end

    unless block_given?
      result += "/>"
    else 
      if @indent
        @level = @level + 1
        result += ">\n#{'  '*@level}"
        result += yield
        @level = @level - 1
        result += "#{'  '*@level}</#{tag_name}>"
      else 
        result += ">#{yield}</#{tag_name}>"
      end
    end
    result + (@indent ? "\n" : "")
  end
end
