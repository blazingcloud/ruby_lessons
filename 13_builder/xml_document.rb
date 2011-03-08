class XmlDocument

  attr_reader :pretty_print

  def initialize(pretty_print = false)
    @pretty_print = pretty_print
    @indent_level = 0
    @tab = "  "
  end

  def indent
    return "" unless pretty_print
    @indent_level += 1
    new_line
  end

  def outdent
    return "" unless pretty_print
    @indent_level -= 1
    new_line
  end

  def new_line(indentation_change = 0)
    return "\n" unless @indent_level > 0
    @indent_level += indentation_change
    "\n" + @tab * @indent_level
  end

  def method_missing(tag_name, *args, &block)
    attributes = args[0] || {}
    doc = "<#{tag_name}"
    attributes.each do |attr_name, attr_value|
      doc << " #{attr_name}='#{attr_value}'"
    end
    if block
      doc << ">"
      doc << indent
      (doc << "#{block.call}</#{tag_name}>")
      doc << outdent
    else
      doc << "/>"
      doc << outdent
    end
  end
end
