# Perfect Number

=begin
The Greek mathematician Nicomachus devised a classification scheme for natural 
numbers (1, 2, 3, ...), identifying each as belonging uniquely to the categories
of abundant, perfect, or deficient based on a comparison between the number and
the sum of its positive divisors (the numbers that can be evenly divided into 
the target number with no remainder, excluding the number itself). For instance,
the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot 
sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.
Examples:

6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 
+ 7 + 14 = 28.
15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 
which is less than 15.
24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 +
2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.
Write a program that can tell whether a number is perfect, abundant, or 
deficient.
=end

class PerfectNumber
  def self.classify(num)
    raise StandardError.new 'Not a Natural Number' unless valid?(num)
    
    case num <=> divisor_sum(num)
      when -1 then 'abundant'
      when 0 then 'perfect'
      when 1 then 'deficient'
    end
  end
  
  class << self
    private
  
    def valid?(num)
      num.is_a?(Integer) && num > 0
    end
    
    def divisor_sum(num)
      divisors = [1]
      counter = 2
      sqrt = Math.sqrt(num)
      while counter <= sqrt
        if num % counter == 0
          divisors << counter
          divisors << num / counter unless counter == sqrt
        end
        counter += 1
      end
      divisors.reduce(:+)
    end
  end
end
