# Beer Song

=begin
Write a program that can generate the lyrics of the 99 Bottles of Beer song. 
See the test suite for the entire song.
=end

class BeerSong
  def self.verse(num)
    first_line(num) + last_line(num - 1)
  end
  
  def self.verses(first, last)
    first.downto(last).each_with_object([]) do |num, result|
      result << self.verse(num)
    end.join("\n")
  end
  
  def self.lyrics
    self.verses(99, 0)
  end
  
  class << self
    private
    
    def first_line(num)
      "#{bottles(num)} of beer on the wall, #{bottles(num).downcase} of beer.\n"
    end
    
    def last_line(num)
      if num < 0
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      else
        "Take #{pronoun(num)} down and pass it around, #{bottles(num).downcase} of beer on the wall.\n"
      end
    end
    
    def bottles(num)
      case num
      when (2..99) then "#{num} bottles"
      when 1 then "1 bottle"
      when 0 then "No more bottles"
      end
    end
    
    def pronoun(num)
      return "it" if num.zero?
      "one"
    end
  end
end
