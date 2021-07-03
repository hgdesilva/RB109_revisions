# Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

# Examples:

# Copy Code
# merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# merge([], [1, 4, 5]) == [1, 4, 5]
# merge([1, 4, 5], []) == [1, 4, 5]

# PROBLEM

# input: 2 sorted arrays
# output: 1 new, sorted array consisting of all the elements from the original two arrays

# the new array must be built 1 element at a time in 'sorted' or proper order

# EXAMPLES
# merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
# merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# merge([], [1, 4, 5]) == [1, 4, 5]
# merge([1, 4, 5], []) == [1, 4, 5]

# return one array if the other is empty 

# DATA STRUCTURE
# a new array to hold the result

#ALGORITHM
# return if either array argument is empty
# initialize 2 pointers:  pointer1 and pointer 2 and set both to zero
# these pointers will be used to refer to the element positions in the first input array and the second input array respectively
# 
# initialize an (empty) 'output' array
# 
# create a loop
#   compare the element at the index of 'pointer1' of the first array with the element at the index of 'pointer2
#   if the element at 'pointer1' is <= the element at 'pointer2' then:
#     add that element to the results array and increment pointer1 by 1
#   if the element at 'pointer2' is < the element at 'pointer1' then:
#     add that element to the results array and increment pointer2 by 1
#   break out of the loop if either pointer1 == (arr.size) or pointer2 == (arr.size)

#   if pointer1 == arr.size
#       add, to the output array, the elements from arr2 from pointer2 to the last element
#   if pointer2 == arr.size
#       add, to the output array,  the elements from arr1 from pointer1 to the last element
  
#   return the output array



def merge(arr1, arr2)
  return arr1 if arr2.empty?
  return arr2 if arr1.empty?

  pointer1 = 0
  pointer2 = 0
  output = []

  loop do
    if arr1[pointer1] <= arr2[pointer2]
      output << arr1[pointer1]
      pointer1 += 1
    elsif arr2[pointer2] < arr1[pointer1]
      output << arr2[pointer2]
      pointer2 += 1
    end

    break if pointer1 == arr1.size || pointer2 == arr2.size
  end

  if pointer1 == arr1.size
    output += arr2[pointer2..-1]
  elsif pointer2 == arr2.size
    output += arr1[pointer1..-1]
  end

  output
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
