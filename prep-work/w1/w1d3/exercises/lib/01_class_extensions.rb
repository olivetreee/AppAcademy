require 'byebug'

# String: Caesar cipher
#
# * Implement a Caesar cipher: http://en.wikipedia.org/wiki/Caesar_cipher
#
# Example:
#   `"hello".caesar(3) # => "khoor"`
#
# * Assume the text is all lower case letters.
# * You'll probably want to map letters to numbers (so you can shift
#   them). You could do this mapping yourself, but you will want to use
#   the [ASCII codes][wiki-ascii], which are accessible through
#   `String#ord` or `String#each_byte`. To convert back from an ASCII code
#   number to a character, use `Fixnum#chr`.
# * Important point: ASCII codes are all consecutive!
#     * In particular, `"b".ord - "a".ord == 1`.
# * Lastly, be careful of the letters at the end of the alphabet, like
#   `"z"`! Ex.: `caesar("zany", 2) # => "bcpa"`


#STUDENT'S NOTE
#The following accounts for strings, punctuation, symbols and lower/uppercase letters.

class String
  def caesar(shift)
    # self.split(" ").each do |word|
      char_codes = convert_to_ascii  #converts to ASCII
      shifted_chars = char_codes.map {|char| shift_char(char,shift)}  #shifts all chars
      shifted_chars.join
    # end
  end

  def shift_char(char_code, shift)
    if valid_letter?(char_code)
      char_code += shift
      char_code -= 26 if char_code > case_limit(char_code)
    end
    char_code.chr
  end

  def convert_to_ascii
    self.chars.map {|char| char.ord}
  end

  def valid_letter?(char_code)
    is_lower = (97..122).cover?(char_code)
    is_upper = (65..90).cover?(char_code)
    is_lower || is_upper
  end

  def case_limit(char_code)
    return 122 if (97..122).cover?(char_code) #z is last lowercase
    90 #Z is last uppercase
  end

end


# Hash: Difference
#
# Write a method, `Hash#difference(other_hash)`. Your method should return
# a new hash containing only the keys that appear in one or the other of
# the hashes (but not both!) Thus:
#
# ```ruby
# hash_one = { a: "alpha", b: "beta" }
# hash_two = { b: "bravo", c: "charlie" }
# hash_one.difference(hash_two)
#  # => { a: "alpha", c: "charlie" }
# ```

class Hash
  def difference(other_hash)
    new_hash_1 = {}
    new_hash_2 = {}
    new_hash_1 = self.reject {|key,value| other_hash.key?(key)}
    new_hash_2 = other_hash.reject {|key,value| self.key?(key)}
    new_hash_1.merge(new_hash_2)
  end

  def difference_v2(other_hash)
    new_hash = {}
    self.keys.each do |key|
      new_hash[key] = self[key] unless other_hash.key?(key)
    end

    other_hash.keys.each do |key|
      new_hash[key] = other_hash[key] unless self.key?(key)
    end

    new_hash
  end

end

# Stringify
#
# In this exercise, you will define a method `Fixnum#stringify(base)`,
# which will return a string representing the original integer in a
# different base (up to base 16). **Do not use the built-in
# `#to_s(base)`**.
#
# To refresh your memory, a few common base systems:
#
# |Base 10 (decimal)     |0   |1   |2   |3   |....|9   |10  |11  |12  |13  |14  |15  |
# |----------------------|----|----|----|----|----|----|----|----|----|----|----|----|
# |Base 2 (binary)       |0   |1   |10  |11  |....|1001|1010|1011|1100|1101|1110|1111|
# |Base 16 (hexadecimal) |0   |1   |2   |3   |....|9   |A   |B   |C   |D   |E   |F   |
#
# Examples of strings your method should produce:
#
# ```ruby
# 5.stringify(10) #=> "5"
# 5.stringify(2)  #=> "101"
# 5.stringify(16) #=> "5"
#
# 234.stringify(10) #=> "234"
# 234.stringify(2)  #=> "11101010"
# 234.stringify(16) #=> "EA"
# ```
#
# Here's a more concrete example of how your method might arrive at the
# conversions above:
#
# ```ruby
# 234.stringify(10) #=> "234"
# (234 / 1)   % 10  #=> 4
# (234 / 10)  % 10  #=> 3
# (234 / 100) % 10  #=> 2
#                       ^
#
# 234.stringify(2) #=> "11101010"
# (234 / 1)   % 2  #=> 0
# (234 / 2)   % 2  #=> 1
# (234 / 4)   % 2  #=> 0
# (234 / 8)   % 2  #=> 1
# (234 / 16)  % 2  #=> 0
# (234 / 32)  % 2  #=> 1
# (234 / 64)  % 2  #=> 1
# (234 / 128) % 2  #=> 1
#                      ^
# ```
#
# The general idea is to each time divide by a greater power of `base`
# and then mod the result by `base` to get the next digit. Continue until
# `num / (base ** pow) == 0`.
#
# You'll get each digit as a number; you need to turn it into a
# character. Make a `Hash` where the keys are digit numbers (up to and
# including 15) and the values are the characters to use (up to and
# including `F`).

class Fixnum

  def stringify(base)
    num_factors = 0
    base_factors = []

    while true
      factor = base**num_factors  #This will be 1,2,4,8,16 etc for base 2, for example
      break if self/factor == 0  #Finishes when the factor is bigger than self

      base_factors << (self / factor) % base  #This will get 101010 on base 2, for example
      base_factors[-1] = convert_to_hex(base_factors[-1]) if base == 16  #If the base is 16, convert the number to hex
      num_factors+=1
    end
    base_factors.reverse.join
  end

  def convert_to_hex(num)
    return num if num < 10
    num += 87
    num.chr
  end


  def stringify_from_solution(base)
    # handle the case where self == 0.
    return "0" if self == 0

    # first find the least-significant digit, the part that goes in the
    # "ones" column. The leftover amount is now a multiple of `base`. We
    # can recursively call our method to represent the high order bits.
    # For example, with 123 on base 10:
    low_digit = self % base  #The units digit: 3 on the first run (FR)
                             #SR: 2
                             #TR: 1
    leftover = self - low_digit  #FR: 123-3 = 120
                                 #SR: 12-2 = 10
                                 #TR: 1-1 = 0

    digits = [
      "0", "1", "2", "3", "4", "5", "6", "7",
      "8", "9", "a", "b", "c", "d", "e", "f"
    ]

    if leftover > 0
      (leftover / base).stringify(base) + digits[low_digit]  #FR: 12.stringify + digits[3]
                                                             #SR: 1.stringify + digits[2]
    else
      # nothing leftover, done.
      digits[low_digit]  #TR: digits[1]
    end
  end


end

# Bonus: Refactor your `String#caesar` method to work with strings containing
# both upper- and lowercase letters.
