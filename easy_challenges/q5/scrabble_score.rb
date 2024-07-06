# Scrabble Score

=begin
Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

You'll need the following tile scores:

Letter => Value
A, E, I, O, U, L, N, R, S, T => 1
D, G => 2
B, C, M, P => 3
F, H, V, W, Y => 4
K => 5
J, X => 8
Q, Z => 10
How to Score

Sum the values of all the tiles used in each word. For instance, lets consider 
word CABBAGE which has the following letters and point values:

3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E
Thus, to compute the final total (14 points), we count:

Copy Code
3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14
=end

class Scrabble
  
  def self.score(word)
    self.new(word).score
  end
  
  def initialize(word)
    @word = word
  end
  
  def score
    return 0 unless @word =~ /[A-Za-z]/
    
    @word.downcase.chars.map { |char| value(char) }.reduce(:+)
  end
  
  private
  
  def value(char)
    case 
    when char =~ /[aeilnor-u]/
      1
    when char =~ /[dg]/
      2
    when char =~ /[bcmp]/
      3
    when char =~ /[fhvwy]/
      4
    when char =~ /k/
      5
    when char =~ /[jx]/
      8
    when char =~ /[qz]/
      10
    else
      0
    end
  end
end
