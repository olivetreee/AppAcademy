# Rubyify
# ----------------------------------------
# Write a function that turns regular sentences into (really bad and
# super long) ruby method names.

def rubyify(sentence)
  sentence.downcase.gsub(" ", "_").delete(".?")
end

## Discussion Topics
#   * What does the gsub method do? What are it's parameters?
#   * What does the argument ".?" tell the delete method to do?



# -----------------



# Key-Value Swap
# ----------------------------------------
# Write a method, #key_value_swap, that accepts a hash as an argument and
# returns a new hash with all the key / value pairs swapped. Do not use Hash#invert.

def key_value_swap(hash)
  new_hash = {}
  hash.each { |k, v| new_hash[v] = k }
  new_hash
end

## Discussion topics:
#   * How are the {} braces on line 23 different from a do ... end block?
#     * When do we prefer one style over the other?
#   * Can you think of a way to do this in one line?
