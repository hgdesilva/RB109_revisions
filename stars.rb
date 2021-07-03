# Write a method that displays an 8-pointed star in an nxn grid, 
# where n is an odd integer that is supplied as an argument to the method.
# The smallest such star you need to handle is a 7x7 grid.

# Examples

# star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *
# Copy Code
# star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

# PROBLEM
# 
# input - should be an integer (n) that is
#           - odd
#           - 7 or above

# output - draw an 8-pointed star
#        - in a 'n x n' grid

# EXAMPLES
# see above
# note that there is a central row of stars of length n 
# above AND below that there are n-2 rows:
#   - each of these rows has 3 stars only
#   - spacing varies with each row:
#       - for the 'mth' row away from the centre, there are 'm-1' spaces between each star
#       - the maximum number of rows is n / 2
#         e.g. for n of 7, maximum rows is 3 with 2 spaces between each star
#   - each row is centred on a width of need

#   DATA STRUCTURE
#   string to create each row and print
#   (possibly use array to create each row, 'joined' by number of spaces)

#   ALGORITHM
#   return if n is even or less than 7
#   calculate the number of rows to print, either side of the central row i.e n / 2

#   display the upper rows
#    - count down from row number n/2 to 1
#         print each row with 3 stars separated by (row number - 1) spaces
#          - each row centred on a width of n

#   display the central row, of size n, stars

#   display the lower rows
#    - count up from row number 1 to n/2
#         print each row with 3 stars separated by (row number - 1) spaces



  def star(n)
   return if n < 7 || n.even?
   num_of_rows = n / 2
  
   num_of_rows.downto(1) do |row_number|
    puts( ("*" + " " * (row_number - 1) + "*" + " " * (row_number - 1) + "*").center(n) )
   end
   
   puts "*" * n

   1.upto(num_of_rows) do |row_number|
    puts(("*" + " " *( row_number - 1) + "*" + " " * (row_number - 1) + "*").center(n))
   end
  end

  star(9)
