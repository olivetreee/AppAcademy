# Vowel Censor
# ----------------------------------------
# Write the function vowel_censor that takes in a string and replaces
# any vowels in it with an "X". Do not modify the original string.

# With regex
def vowel_censor(string)
  string.gsub(/[aeiou]/, 'X')
end

# Without regex
def vowel_censor(string)
  vowels = ['a', 'e', 'i', 'o', 'u']
  new_string = ""
  string.each_char do |c|
    if vowels.include?(c)
      new_string << "X"
    else
      new_string << c
    end
  end
  new_string
end

## Discussion Topics
#   * NOTE: you do not need to know regex to make it through jumpstart, but it is a nice tool!
#   * What does the #each_char method do?
#   * What is the name of this operator '<<' and what string method does it perform?






# Print 10
# ----------------------------------------
# Write a method, #array_print_10, that puts the numbers 0 - 9 using an array
# and the each method

def array_print_10
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].each do |n|
    puts n
  end
end

# Write a method, #range_print_10, that prints the numbers 0 - 9 using a range
# and the each method

def range_print_10
  (0..9).each do |n|
    puts n
  end
end

# Write a method, #integer_print_10, that prints the numbers 0 - 9 using an integer
# and the times method

def integer_print_10
  puts self
  10.times do |n|
    puts n
  end
end

## Discussion topics:
#   * Which of these loops did you find easiest to write?
