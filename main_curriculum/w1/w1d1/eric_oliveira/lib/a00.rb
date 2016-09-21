require 'byebug'

# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def divide_by_tens(num,power)
  tens = 10 ** power
  new_num = num / tens
  units = num % tens
  [new_num,units]
end

def digital_root(num)
  # byebug
  root_num = 0
  pwr = 1
  num, unit = divide_by_tens(num, pwr)
  until unit == 0
    root_num += unit
    pwr += 1
    num, unit = divide_by_tens(num, pwr)
  end
  root_num = digital_root(root_num) if root_num > 9
  root_num
  #call recursevely
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet= nil)
  alphabet ||= ("a".."z").to_a

  result = ""
  alpha_indexes = []
  str.each_char.with_index do |char,idx|
    alpha_indexes << alphabet.index(char)
  end

  alpha_indexes.sort.each do |idx|
    result += alphabet[idx]
  end

  result

end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def sum_to_zero?(num_1,num_2)
    num_1 + num_2 == 0
  end

  def two_sum
    result = []
    self.each_with_index do |num_1,idx_1|
      break if idx_1 == self.length-1
      for idx_2 in (idx_1+1...self.length)
        num_2 = self[idx_2]
        result << [idx_1,idx_2] if sum_to_zero?(num_1,num_2)
      end
    end
    result
  end

end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    result = []
    chars = self.split("")
    chars.each_with_index do |char,idx_1|
      substring = ""
      for idx_2 in (idx_1+1...chars.length)
        substring += chars[idx_2]
        result << substring if dictionary.include?(substring)
      end
    end
    result.uniq
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  factors = []
  1.upto(num) do |factor|
    factors << factor if num % factor == 0
  end
  factors
end





#end
