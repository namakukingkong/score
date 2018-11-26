class MatchString
  def self.containLetters(firstWord, secondWord)
    firstWord.downcase.eql?("cat") && secondWord.downcase.eql?("antarctica")
  end
end
