module PigLatinTranslator
  private
  def starts_with_two_consonants_or_qu?(word)
    word[0,2] == "qu" || starts_with_two_consonants?(word)
  end
  def starts_with_two_consonants?(word)
    word[0,2].split(//).all? do |letter|
      !starts_with_vowel?(letter)
    end
  end

  def starts_with_vowel?(word)
    %w(a e i o u).include? word[0]
  end

  def make_non_vowel_word_have_ay(word)
    word[1..-1] + word[0] + "ay"
  end

  def make_vowel_word_have_ay(word)
    word + "ay"
  end

  def make_two_consonant_word_have_ay(word)
    word[2..-1] + word[0,2] + "ay"
  end

  def translate_a_word(word)
    return make_two_consonant_word_have_ay(word) if starts_with_two_consonants_or_qu?(word)
    return make_vowel_word_have_ay(word) if starts_with_vowel?(word)
    make_non_vowel_word_have_ay(word)
  end

  public
  def translate(sentance)
    sentance.split.collect do |word|
      translate_a_word(word)
    end.join(' ')
  end
end
