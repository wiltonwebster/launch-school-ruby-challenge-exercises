# Diamond

=begin
The diamond exercise takes as its input a letter, and outputs it in a diamond
shape. Given a letter, it prints a diamond starting with 'A', with the supplied
letter at the widest point.

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.
=end

class Diamond
  def self.make_diamond(letter)
    @@letter_num = letter.ord - 64
    @@width = @@letter_num * 2 - 1
    generate_diamond
  end
  
  class << self
    private
    
    def generate_row(num)
      margin = ' ' * ((@@width + 1) / 2 - num)
      letter = (num + 64).chr
      return margin + letter + margin if num == 1
      
      central_buffer = ' ' * (2 * num - 3)
      margin + letter + central_buffer + letter + margin
    end
    
    def generate_diamond
      result = ''
      counter = 1
      
      while counter < @@letter_num
        result << generate_row(counter)
        result << "\n"
        counter += 1
      end
      
      while counter > 0
        result << generate_row(counter)
        result << "\n"
        counter -= 1
      end
      result
    end
  end
end
