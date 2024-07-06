# Point Mutations

=begin
Write a program that can calculate the Hamming distance between two DNA strands.

A mutation is simply a mistake that occurs during the creation or copying of a
nucleic acid, in particular DNA. Because nucleic acids are vital to cellular 
functions, mutations tend to cause a ripple effect throughout the cell. Although
mutations are technically mistakes, a very rare mutation may equip the cell with
a beneficial attribute. In fact, the macro effects of evolution are attributable
to the accumulated result of beneficial microscopic mutations over many 
generations.

The simplest and most common type of nucleic acid mutation is a point mutation,
which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken 
from different genomes with a common ancestor, we get a measure of the minimum 
number of point mutations that could have occurred on the evolutionary path 
between the two strands.

This is called the Hamming distance.

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. If you have 
two sequences of unequal length, you should compute the Hamming distance over
the shorter length.
=end

class DNA
  def initialize(sequence)
    @sequence = sequence
  end
  
  def hamming_distance(new_sequence)
    compare_length = [sequence.length, new_sequence.length].min
    original_chars = sequence.chars.slice(0, compare_length)
    new_chars = new_sequence.chars.slice(0, compare_length)
    count_changed_elements(original_chars, new_chars)
  end
  
  private
  
  attr_reader :sequence
  
  def count_changed_elements(arr1, arr2)
    arr1.select.with_index { |elem, idx| elem != arr2[idx] }.size
  end
end