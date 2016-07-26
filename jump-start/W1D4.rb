require 'byebug'
# Rubyify
# ----------------------------------------
# Write a function that turns regular sentences into (really bad and
# super long) ruby method names.

def rubyify(sentence)
end

# puts "---------Rubyify----------"
# puts rubyify("Leave the gun take the canoli.") == "leave_the_gun_take_the_canoli"
# puts rubyify("Driver roll up the partition please") == "driver_roll_up_the_partition_please"
# puts rubyify("Wanna get Cheeseboard pizza?") == "wanna_get_cheeseboard_pizza"



# Key-Value Swap
# ----------------------------------------
# Write a method, #key_value_swap, that accepts a hash as an argument and
# returns a new hash with all the key / value pairs swapped. Do not use Hash#invert.

def key_value_swap(hash)
end

puts "---------Key Value Swap----------"
puts key_value_swap({a: :b, c: :d, e: :f}) == {b: :a, d: :c, f: :e}
puts key_value_swap({1 => "string"}) == {"string" => 1}
puts key_value_swap({a: :a, 1 => 1}) == {a: :a, 1 => 1}
