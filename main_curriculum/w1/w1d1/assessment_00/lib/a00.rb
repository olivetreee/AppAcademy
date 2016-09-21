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
  alphabet = ("a".."z").to_a
  result = ""
  str.each_char do |char|
    if char == " "
      result += " "
      next
    end
    char_alpha_idx = alphabet.index(char)
    new_alpha_idx = (char_alpha_idx + shift) % 26
    result += alphabet[new_alpha_idx]
  end
  result
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def divide_by_tens(num,power)

end

def digital_root(num)
  # byebug
  sum_result = 0
  until num/10 == 0
    sum_result += num % 10
    num /= 10
  end
  sum_result += num
  sum_result = digital_root(sum_result) if sum_result > 9
  sum_result
end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet= nil)
  alphabet = ("a".."z").to_a if alphabet.nil?
  alpha_indexes = []
  str.each_char do |char|
    alpha_indexes << alphabet.index(char)
  end

  new_str = ""
  alpha_indexes.sort.each do |idx|
    new_str += alphabet[idx]
  end

  new_str

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
    self[0...-1].each_with_index do |num_1,idx_1|
      self[1..-1].each_with_index do |num_2,idx_2|
        result << [idx_1,idx_2+1] if sum_to_zero?(num_1,num_2)
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
    # byebug
    self.each_char.with_index do |char_1,idx_1|
      substr = char_1
      result << substr if dictionary.include?(substr)
      for idx_2 in (idx_1+1...self.length)
        substr += self[idx_2]
        result << substr if dictionary.include?(substr)
      end
    end
    result.uniq
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  result = []
  (1..num).each do |factor|
    result << factor if num % factor == 0
  end
  result

end




#end
