#Sum of Multiples

=begin
Write a program that, given a natural number and a set of one or more other 
numbers, can find the sum of all the multiples of the numbers in the set that 
are less than the first number. If the set of numbers is not given, use a 
default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 
that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The
sum of these multiples is 78.
=end

class SumOfMultiples
  def self.to(limit)
    SumOfMultiples.new.to(limit)
  end
  
  def initialize(*factors)
    @factors = factors.empty? ? [3, 5] : factors
  end
  
  def to(limit)
    list = find_multiples(limit)
    list.uniq.sum
  end
  
  private
  
  attr_reader :factors
  
  def find_multiples(limit)
    list = []
    factors.each do |factor|
      (1...limit).each do |num|
        list << num if num % factor == 0
      end
    end
    list
  end
end
