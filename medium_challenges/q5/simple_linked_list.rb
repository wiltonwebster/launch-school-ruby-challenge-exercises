# Simple Linked List

=begin
Write a simple linked list implementation. The linked list is a fundamental data
structure in computer science, often used in the implementation of other data 
structures.

The simplest kind of linked list is a singly linked list. Each element in the 
list contains data and a "next" field pointing to the next element in the list 
of elements. This variant of linked lists is often used to represent sequences 
or push-down stacks (also called a LIFO stack; Last In, First Out).

Let's create a singly linked list whose elements may contain a range of data
such as the numbers 1-10. Provide methods to reverse the linked list and convert
a linked list to and from an array.
=end

class Element
  attr_reader :datum
  
  def initialize(datum, linked_to = nil)
    @datum = datum
    @linked_to = linked_to
  end
  
  def tail?
    linked_to.nil?
  end
  
  def next
    linked_to
  end
  
  private
  
  attr_reader :linked_to
end

class SimpleLinkedList
  def self.from_a(arr)
    new_list = self.new
    return new_list if arr == nil || arr.empty?
    
    arr.reverse.each { |elem| new_list.push(elem) }
    new_list
  end
  
  def initialize
    @list = []
  end
  
  def empty?
    list.empty?
  end
  
  def size
    list.size
  end
  
  def push(datum)
    elem = Element.new(datum, list.first)
    list.unshift(elem)
  end
  
  def head
    list.first
  end
  
  def peek
    head.datum if head
  end
  
  def pop
    list.shift.datum if head
  end
  
  def to_a
    list.map(&:datum)
  end
  
  def reverse
    self.class.from_a(to_a.reverse)
  end
  
  private
  
  attr_reader :list
end