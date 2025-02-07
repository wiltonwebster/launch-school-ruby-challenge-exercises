# Anagrams

=begin
Write a program that takes a word and a list of possible anagrams and selects 
the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", 
"google", "inlets", and "banana", the program should return a list containing
"inlets". Please read the test suite for the exact rules of anagrams.
=end

class Anagram
  def initialize(word)
    @word = word
  end
  
  def match(candidates)
    candidates.select do |candidate|
      !same_word?(candidate) && anagram?(candidate)
    end
  end
  
  private
  
  def same_word?(candidate)
    candidate.downcase == @word.downcase
  end
  
  def anagram?(candidate)
    candidate.downcase.chars.sort == @word.downcase.chars.sort
  end
end
