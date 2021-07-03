# You have a bank of switches before you, numbered from 1 to n. Each switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You go back to the beginning, and on this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back again to the beginning and toggle switches 3, 6, 9, and so on. You repeat this process and keep going until you have been through n repetitions.

# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.

# Example with n = 5 lights:

# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1, 3, 5 are on
# round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
# round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
# The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

# With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].


# PROBLEM
# input - an integer n
# a bank (row) of switches, of size from 1 to 'n', each connected to one light
# initially each switch is in the 'off' position

# n times go to each switch in turn
#  - on first pass through 'toggle' (ie if off, turn on. if on, turn off) 
#  - on second pass 'toggle' switches 2, 4, 6 etc..
#  - on third pass 'toggle' switches 3, 6, 9 etc..
#  - pattern is that if the switch number is a multiple of 'n' then it is toggled

# method should:
# - take one argument - the number of switches (an integer)
# - output an array. the elements of the array should be the the number(s) of the lights/switches on after 'n' rounds of toggling

# EXAMPLES
# when input is 5, output should be [1,4]
# when input is 10, output should be [1,4,9]

# DATA STRUCTURE

# options
# 1.  an array with each element representing a swtich. the index will be 1 less than the switch number
# wiht the value either being 'on' or 'off'

# 2. a hash with key being an integer representing switch number and value representing 'on' or 'off' status (or 0 or 1)

# ALGORITHM
# - initialize a hash with 'n' keys with each value being 'off'
# - iterate over hash 'n' times
#   if the key is a multiple of the current round number then toggle it's value
#
# - initiate a results array
# - iterate over the hash to identify each key-value pair where value is 'on', add the corresponding key to the results array
# -return the results array


def lights(n)
  bank_of_switches = Hash.new(0)
  1.upto(n) do |switch|
    bank_of_switches[switch] = 'off'
  end
  
  1.upto(n) do |round|
    bank_of_switches.each do |k,v|
      if k % round == 0
        bank_of_switches[k] == 'off' ? bank_of_switches[k] = 'on' : bank_of_switches[k] = 'off'
      end
    end
 end
 
  results = []
  bank_of_switches.each do |k,v|
    results << k if v =='on'
  end

  results
end

p lights(5) == [1,4]
p lights(10) == [1,4,9]