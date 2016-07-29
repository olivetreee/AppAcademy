# Pizza Slices
# ----------------------------------------
# You are cutting a gigantic pizza. Given the circumference of the pizza
# and the length of the crust of each slice, return the exact number
# (i.e. potentially including a partial slice up to three decimal places)
# of slices you can cut from that pizza.

def pizza_slices(circumference, crust_length)
  num_pizzas=circumference/crust_length.to_f
  num_pizzas.round(3)

end

puts "---------Pizza Slices----------"
puts pizza_slices(100, 3) == 33.333
puts pizza_slices(30, 4) == 7.5
puts pizza_slices(5000, 135) == 37.037



# ----------------- Switch Roles!



# String Sum
# ----------------------------------------
# Write a method, #string_sum, that accepts a string as an argument and returns
# the sum of the characters of that string. ie: a --> 1, b--> 2 .. z --> 26.
# Assume you have an input of only lower-case characters. You may want to define
# a helper method! (hint hint)

def string_sum(string)
end

puts "---------String Sum----------"
puts string_sum("pizza") == 78
puts string_sum("bagel") == 27
puts string_sum("smoothie") == 104
