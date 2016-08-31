

def identify_sheep
  sheep = ["Gary", "Adam", "Jacob", "Sam", "Toby", "Billy", "Mandy", "Guinness"]

  index = 0

  while index < sheep.length
    individual_sheep = sheep[index]
    sheep_with_exclamation_point = individual_sheep + "!"
    puts "This sheep is named #{sheep_with_exclamation_point}"
    index += 1
  end

end

identify_sheep
