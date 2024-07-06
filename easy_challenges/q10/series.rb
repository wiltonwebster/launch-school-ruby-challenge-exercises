# Series

=begin
Write a program that will take a string of digits and return all the possible 
consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

012
123
234

Likewise, here are the 4-digit series:

0123
1234

Finally, if you ask for a 6-digit series from a 5-digit string, you should throw
an error.
=end

class Series
  def initialize(input)
    @number_string = input
  end
  
  def slices(length)
    raise ArgumentError.new "Cannot create slices of this length" unless valid?(length)
    
    digits = number_string.chars.map(&:to_i)
    last_starting_index = number_string.length - length
    
    0.upto(last_starting_index).each_with_object([]) do |idx, result|
      result << digits.slice(idx, length)
    end
  end
  
  private
  
  attr_reader :number_string
  
  def valid?(length)
    length <= number_string.length && length.is_a?(Integer)
  end
end