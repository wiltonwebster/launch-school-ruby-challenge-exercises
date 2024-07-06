# Custom Set

=begin
Create a custom set type.

Sometimes it is necessary to define a custom data structure of some type, like a
set. In this exercise you will define your own set type. How it works internally
doesn't matter, as long as it behaves like a set of unique elements that can be
manipulated in several well defined ways.

In some languages, including Ruby and JavaScript, there is a built-in Set type.
For this problem, you're expected to implement your own custom set type. Once
you've reached a solution, feel free to play around with using the built-in
implementation of Set.

For simplicity, you may assume that all elements of a set must be numbers.
=end

class CustomSet
  def initialize(set = [])
    @set = set.uniq
  end
  
  def empty?
    set.empty?
  end
  
  def contains?(elem)
    set.include?(elem)
  end
  
  def subset?(other_set)
    set.all? { |elem| other_set.contains?(elem) }
  end
  
  def disjoint?(other_set)
    set.none? { |elem| other_set.contains?(elem) }
  end
  
  def eql?(other_set)
    subset?(other_set) && other_set.subset?(self)
  end
  
  alias == eql?
  
  def add(elem)
    set.push(elem) unless contains?(elem)
    self
  end
  
  def intersection(other_set)
    intersection_set = set.select { |elem| other_set.contains?(elem) }
    self.class.new(intersection_set)
  end
  
  def difference(other_set)
    difference_set = set.reject { |elem| other_set.contains?(elem) }
    self.class.new(difference_set)
  end
  
  def union(other_set)
    union_set = (set + other_set.set).uniq
    self.class.new(union_set)
  end
  
  private
  
  attr_writer :set
  
  protected
  
  attr_reader :set
end

set = CustomSet.new
p set.add(3)
