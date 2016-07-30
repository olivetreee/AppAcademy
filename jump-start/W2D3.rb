# Longest Segment
# ----------------------------------------
# Write a method, #longest_segment, that accepts two strings as arguments. The
# first is a long string of characters, and the second is a delimeter. Split the
# first string by the delimeter and return the longest segment.

def longest_segment(input, delimeter)
  words = input.split(delimeter)
  long_word = words[0]
  words.each do |word|
    if word.length > long_word.length
      long_word = word
    end
  end
  long_word
end

puts "---------Longest Segment----------"
puts longest_segment('this is a string','a') == "this is "
puts longest_segment('this is a string',' ') == "string"
puts longest_segment('this is a string','i') == "s a str"



# ----------------- Switch Roles!



# Next Prime
# ----------------------------------------
# Write a method, #next_prime, that accepts an integer, n, as an argument
# and returns the smallest prime number that is greater than n
def is_prime?(num)
  return false if num < 2
  for i in 2..num/2
    if num%i == 0
      return false
    end
  end
  return true
end
def next_prime(n)
  n = n+1
  until is_prime?(n)
    n+=1
  end
  return n
end

puts "---------Next Prime----------"
puts next_prime(19) == 23
puts next_prime(100) == 101
