# ------------------------------------------------------------------------------
# Instructions
# ------------------------------------------------------------------------------
# Make sure everything puts out as 'true' when you run the file.
# When time is up, make sure you don't have any unexpected `end`s or infinite loops
# that would keep your code from running.
# Rename the file to be your firstname and lastname.
#
# Do not use the internet.  Do not reference the exercises.  If you forget a
# particular ruby method, write it yourself.
#
# Do not change the parameters passed into the functions in this file.
#
# Test your code with a few cases in addition to the ones we give
# you.  When we grade you, we use different test cases to make sure your logic
# is sound.
#
# Use the debugger when code doesn't run how you expect.
# ------------------------------------------------------------------------------
#
# Factorial
# ------------------------------------------------------------------------------
# A number factorial is the product of all whole
# numbers between 1 and num multiplied together.
# factorial(4) => 4 * 3 * 2 * 1 => 24
# ------------------------------------------------------------------------------
def factorial(num)
  product = 1
  num.downto(2) do |number|
    product*=number
  end

  product

end
# ------------------------------------------------------------------------------
puts "-------Factorial-------"
puts factorial(1) == 1
puts factorial(4) == 24
puts factorial(5) == 120
puts factorial(10) == 3628800
# ------------------------------------------------------------------------------

# Long Word Count
# ------------------------------------------------------------------------------
# Return the number of words longer than 7 characters
# "cat cactus balderdash phenomenon amazon" has two words over 7 characters long
# "balderdash" and "phenomenon"
# long_word_count("cat cactus balderdash phenomenon amazon") => 2
# ------------------------------------------------------------------------------
def long_word_count(text)

  text.split(" ").select {|word| word.length>7}.count

end
# ------------------------------------------------------------------------------
puts "-------Long Word Count-------"
puts long_word_count("") == 0
puts long_word_count("short words only") == 0
puts long_word_count("one reallylong word") == 1
puts long_word_count("two reallylong words inthisstring") == 2
puts long_word_count("seventy schfifty five") == 1
# ------------------------------------------------------------------------------

# Least Common Multiple
# ------------------------------------------------------------------------------
# Return the lowest number which is a multiple of both inputs.
#
# Example of a multiple: 12 is a multiple of 4 because 12 is evenly
# divisible by 4.
#
# the least common multiple of 2 and 3 is 6
# the least common multiple of 6 and 10 is 30
# it is NOT ALWAYS the product of the inputs
# lcm(6, 10) => 30
#
# the lcm for equal numbers is that number
# lcm(50, 50) => 50
# ------------------------------------------------------------------------------
def lcm(a, b)
  #find the largest of the two (a*b)
  #largest.times (exclude 0)
  #return when found one

  largest_lcm = a*b
  largest_lcm.times do |num|
    next if num == 0
    return num if num%a==0 && num%b == 0
  end
end
# ------------------------------------------------------------------------------
puts "-------Least Common Multiple-------"
puts lcm(2, 3) == 6
puts lcm(6, 10) == 30
puts lcm(24, 26) == 312
puts lcm(50, 50) == 50
# ------------------------------------------------------------------------------

# Largest Odd Factors
# ------------------------------------------------------------------------------
# Return an array of the largest odd factors NOT including the number itsself
# The factors of 20 are 1, 2, 5, and 10
# The largest odd factor of 20 is 5 because 10 is even
# largest_odd_factors([10, 20, 30]) => [5, 5, 15]
# ------------------------------------------------------------------------------

def is_odd? (num)
  num%2 != 0
end

def is_factor?(num,factor)
  num%factor == 0
end

def find_odd_factors(num)
  #max factor is num/2
  #run upto max_factor |factor|
    #if is_factor and is_odd, store factor
  #return factors

  factors = []
  max_num_of_factors = num/2
  1.upto(max_num_of_factors) do |factor|
    factors << factor if is_factor?(num,factor) && is_odd?(factor)
  end
  factors
end


def largest_odd_factors(nums)
  #helper is_odd?
  #helper is_factor?
  #helper find_odd_factors
  #odd_facs.sort[-1]

  odd_factors=[]

  nums.each do |num|
    odd_factors << find_odd_factors(num).sort[-1]
  end

  odd_factors
end
# ------------------------------------------------------------------------------
puts "-------Largest Odd Factor-------"
puts largest_odd_factors([]) == []
puts largest_odd_factors([5]) == [1]
puts largest_odd_factors([8]) == [1]
puts largest_odd_factors([26, 27, 28, 29]) == [13, 9, 7, 1]
puts largest_odd_factors([10, 20, 30]) == [5, 5, 15]
# ------------------------------------------------------------------------------

# Fibonacci Sequence
# ------------------------------------------------------------------------------
# The Fibonacci sequence is defined as fib(n) = fib(n - 1) + fib(n - 2).
# The sequence starts with 0 and 1 as the first two Fibonacci numbers
# and builds up from there, each subsequent Fibonacci being the sum of
# the previous two.
#
# Return the first n many Fibonacci numbers, starting with 0.
# fibs(5) => [0, 1, 1, 2, 3]
# ------------------------------------------------------------------------------
def fibs(n)
  #define starter as [0,1]
  #edge case if 0 or 1
  #fib_sequence = [0,1]
  #(n-2).times do |idx| (we already have two elements on the starter)
  #fib_sequence << fib_sequence[idx] + fib_sequence[idx+1]
  #return fib_seq

  #edge cases
  return [] if n == 0
  return [0] if n == 1

  fib_sequence = [0,1]

  (n-2).times do |idx|
    fib_sequence << fib_sequence[idx] + fib_sequence[idx+1]
  end

  fib_sequence

end
# ------------------------------------------------------------------------------
puts "-------Fibonacci-------"
puts fibs(0) == []
puts fibs(1) == [0]
puts fibs(2) == [0, 1]
puts fibs(3) == [0, 1, 1]
puts fibs(10) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
# ------------------------------------------------------------------------------

# Hipsterfy
# ------------------------------------------------------------------------------
# Input is a string containing several words.
# Return a string with the last vowel removed from each word. 'y' is not a vowel.
# If a word has no vowels, don't change it.
#
# hipsterfy("towel flicker banana") => "towl flickr banan"
# ------------------------------------------------------------------------------
def hipsterfy(str)
  #split into words
  #split into chars
  #run chars downto (index)
  #if vowels.include?(char.downcase), delete_at(index) [do a #downcase just in case(pun not intended)]
  #break from chars into next word


  vowels = ["a","e","i","o","u"]
  words = str.split
  words.map! do |word|
    chars = word.split("")
    (chars.length-1).downto(0) do |index|
      if vowels.include?(chars[index].downcase)
        chars.delete_at(index)
        break
      end
    end
    word = chars.join
  end
  words.join(" ")
end
# ------------------------------------------------------------------------------
puts "-------Hipsterfy-------"
puts hipsterfy("proper") == "propr"
puts hipsterfy("squeaker") == "squeakr"
puts hipsterfy("mstrkrft") == "mstrkrft"
puts hipsterfy("proper tonic panther") == "propr tonc panthr"
puts hipsterfy("towel flicker banana") == "towl flickr banan"
puts hipsterfy("runner anaconda") == "runnr anacond"
puts hipsterfy("turtle cheeseburger fries") == "turtl cheeseburgr fris"

# ------------------------------------------------------------------------------
# Pair Product
# ------------------------------------------------------------------------------
# Given an array of numbers and a target product, return whether any pair of
# elements in the array multiplied together equals that product.
#
# You cannot multiply an element by itself.  An element on its own is not
# a product.
#
# pair_product?([3, 1, 5], 15) => true
# ------------------------------------------------------------------------------
def pair_product?(arr, target_product)
  #take pairs through #combination
  #if elements product == target_product, return true
  #false at the end

  arr.combination(2) do |pair|
    return true if pair[0]*pair[1] == target_product
  end
  false
end
# ------------------------------------------------------------------------------
puts "-------Pair Product-------"
puts pair_product?([5, 10, 15, 20, 25, 30], 75) == true
puts pair_product?([2, 4, 8, 16], 128) == true
puts pair_product?([10, 20], 10) == false
puts pair_product?([1, 2], 4) == false
puts pair_product?([], 1) == false

# ------------------------------------------------------------------------------

# Repeated Chars
# ------------------------------------------------------------------------------
# Input is a word.
# Return an array of all the characters that appear multiple times consecutively.
# repeated_chars("mississippi") => ["s, s, p"]
# ------------------------------------------------------------------------------
def repeated_chars(word)


  #loop through Chars
  #if char[i] == char[i+1] && !sequence, activate sequence and store char into arr
  #if char[i] != char[i+1] && sequence, deactivate sequence
  #return arr

  repeats = []
  sequence = false
  chars = word.chars
  chars.each_with_index do |char,idx|
    break if idx == chars.length-1  #reached the last element

    if char == chars[idx+1] && !sequence  #if a repeat and not in a seq, start a seq
      sequence = true
      repeats << char
    end

    if char != chars[idx+1] && sequence  #if in a seq and char is !=, end the seq
      sequence = false
    end

  end

  repeats

end

#Maybe could also do something around chars.select {|char| char.count > 1}??

# ------------------------------------------------------------------------------
puts "-------Repeated Chars-------"
puts repeated_chars("cat") == []
puts repeated_chars("caat") == ['a']
puts repeated_chars("applle") == ['p', 'l']
puts repeated_chars("mississippi") == ['s', 's', 'p']
puts repeated_chars("caataapulllllt") == ['a', 'a', 'l']


# ------------------------------------------------------------------------------
# Finished?
# ------------------------------------------------------------------------------
# Make sure everything puts out as 'true' when you run the file.
# Make sure you don't have any unexpected `end`s or infinite loops
# that would keep your code from running.
#
# Rename the file to be your firstname and lastname.
# ------------------------------------------------------------------------------
