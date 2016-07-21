# Puts While / Puts Each
# ----------------------------------------
# Write a method, #puts_while, that accepts an array as an argument and will puts
# every element in the array. Do this using a while loop.

def puts_while(array)
  idx = 0
  while idx < array.length
    puts array[idx]
    idx += 1
  end
end

# Write a method, #puts_each, that accepts an array as an argument and will puts
# every element in the array. Do this using Array's #each method

def puts_each(array)
  array.each do |element|
    puts element
  end
end

## Discussion topics:
#   * Which of these loops reads more like English?




# Present Pet
# ----------------------------------------
# Write a method, #present_pet, that takes two arguments:
# a pet name and an animal type, both strings. It should return a string
# that announces the pet (e.g. if given "Todd" and "turtle", it
# should return "Todd the turtle has arrived.").

def present_pet(pet_name, animal)
  "#{pet_name} the #{animal} has arrived."
end

## Discussion topics
#   * With strings, is either interpolation or concatenation better? Why?
#   * Why is there no return statement?
