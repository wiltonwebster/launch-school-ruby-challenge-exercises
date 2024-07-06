array = [1,2,3,4]

array2 = [5,2,7,4]

p array.select.with_index { |elem, idx| elem == array2[idx] }