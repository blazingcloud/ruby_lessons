class Simon
  def echo(thing)
    thing
  end
  def shout(word)
    word.upcase
  end
  def repeat(word,num = 2)
    ((word + " ")* num).chop
  end
  def start_of_word(word,num)
    word.slice(0,num)
  end
  def first_word(string)
    string.split().first
  end
end
