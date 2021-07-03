# A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

# featured(12) == 21
# featured(20) == 21
# featured(21) == 35
# featured(997) == 1029
# featured(1029) == 1043
# featured(999_999) == 1_023_547
# featured(999_999_987) == 1_023_456_987

# featured(9_999_999_999)  There is no possible number that fulfills those requirements

# PROBLEM

# a featured number is:
# - odd
# - a multiple of 7
# - digits appear once only

# method should
# - input : take a single integer as an argument
# - output, either:
#   -- the next featured number greater than the input integer or 
#   -- return an error message "There is no possible number that fulfils those requirements" if there is no next featured number

# EXAMPLES

# see above. upper limit to check for is 9_999_999_999

# DATA STRUCTURE
#  array to assess if an integer is only composed of uniqe digits
#  e.g by converting to a string, then an array and removing duplicates, and comparing array sizes 'before' and 'after' uniq invocation

# EXAMPLES
# see above 
# note maximum number is 9_999_999_999

# ALGORITHM
# create a loop and:
#  start from (input + 1) 
#   check if the new number is the next_featured_number
#     - i.e the number is odd, a multiple of 7 and digits appears only once
#     - use odd? for test of odd
#     - use %7 == 0 to check for multiple of 7
#     - compare int.to_s.chars.size  to  int.to_s.chars.uniq.size to check if the number has 'unique' dgits only
#   if the new integer passes those checks then return it
#   otherwise increment 'new number' by 1  
#   break if  until the 'new number is  9_999_999_999
#   return the error message (as no next-featrued number is found if execution reaches here)



def featured(int)
  loop do 
    int += 1
    if int.odd? && int % 7 == 0
      return int if int.to_s.chars.uniq == int.to_s.chars
    end
    break if int == 9_999_999
  end
  "There is no possible number that fulfils those requirements"
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987