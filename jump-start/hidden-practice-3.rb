require 'byebug'

# Write a functinon that takes a string and
# returns a hash in which each key is a character in the string
# pointing to an array indicating the index that the character
# first occurs and last occurs.
#
# If the character occurs only once, the array should hold a single index
#
# Example:
#
# str = "banana"
# return {"b" => [0], "a" => [1, 5], "n" => [2, 4]}
# "b" occurs once at index 0
# "a" occurs three times, but the first is at index 1 and the last is at index 5
# "n" occurs three times, but the first is at index 2 and the last is at index 4

def find_first_instance(str,char)
  str.index(char)
end

def find_last_instance(str,char)
  reversed_idx = str.reverse.index(char)
  idx = str.length - 1 - reversed_idx
end


def first_last_indices(str)
  str_chars = Hash.new {|h,k| h[k] = []}
  uniq_chars = str.chars.uniq
  uniq_chars.each do |char|
    first_instance = find_first_instance(str,char)
    last_instance = find_last_instance(str,char)
    if first_instance == last_instance
      str_chars[char] = [first_instance]
    else
      str_chars[char] = [first_instance,last_instance]
    end
  end
  str_chars
end


puts "-------First Last Indices-------"
puts first_last_indices("cat") == {"c" => [0], "a" => [1], "t" => [2]}
puts first_last_indices("dude") == {"d" => [0, 2], "u" => [1], "e" => [3]}
puts first_last_indices("banana") == {"b" => [0], "a" => [1, 5], "n" => [2, 4]}
puts first_last_indices("racecar") == {"r" => [0, 6], "a" => [1, 5], "c" => [2, 4], "e" => [3]}


##################


# Anagrams are two words with the exact same letters.
# Write a function that take two strings and returns true if they are anagrams
# and false if they are not.

def str_char_count (string)
  char_count = Hash.new(0)
  string.each_char do |char|
    char_count[char]+=1
  end
  char_count
end

def anagrams?(str1, str2)
  str1_chars = str_char_count(str1)
  str2_chars = str_char_count(str2)

  return false if str1_chars.keys.count != str2_chars.keys.count

  str1_chars.each do |char,count|
    return false if count != str2_chars[char]
  end

  true

end

puts "-------Anagrams-------"
puts anagrams?("alert", "alter") == true
puts anagrams?("desert", "rested") == true
puts anagrams?("banana", "fofanna") == false
puts anagrams?("meat master", "team stream") == true


# An abundant number is a number that is less than the sum of its divisors,
# not including itself.

# Ex. 12's divisors are 1, 2, 3, 4, 6, which sum to 16
# 16 > 12 so 12 is an abundant number.

# Write a function that takes a number and return true if the number is abundant
# otherwise, return false.


##################

def is_factor?(num,factor)
  num%factor == 0
end

def abundant?(num)
  factors = []
  num.times do |factor|
    next if factor == 0
    factors << factor if is_factor?(num,factor)
  end

  factors_sum = factors.reduce {|sum,num| sum+=num}
  factors_sum > num

end

puts "-------Abundant-------"
puts abundant?(12) == true
puts abundant?(24) == true
puts abundant?(9) == false
puts abundant?(10001) == false
puts abundant?(20000) == true


##################


# Save the Prisoner!
#
# A jail has n prisoners, and each prisoner has a unique ID number, ranging
# from 1 to n. There are m sweets that must be distributed to the prisoners.
# The jailer decides the fairest way to do this is by sitting the prisoners
# down in a circle (ordered by ascending ID number), and then, starting with
# some random prisoner, distribute one candy at a time to each sequentially
# numbered prisoner until all candies are distributed. For example, if the
# jailer picks prisoner ID=2, then his distribution order would be
# (2,3,4,5,...,n-1,n,1,2,3,4,...) until all m sweets are distributed.
#
# But wait — there's a catch — the very last sweet is poisoned! Can you find and
# print the ID number of the last prisoner to receive a sweet so they can be warned?
#
# n => Number of Prisoners
# m => Number of Sweets
# ID => Starting ID
# save_the_prisoner(N,M,ID)


def save_the_prisoner(n, m, id)
  num_of_sweets = m
  num_of_prisioners = n
  prisioners = (1..num_of_prisioners).to_a
  current_idx = id - 1
  while num_of_sweets > 0
    current_idx = current_idx == num_of_prisioners ? 1 : current_idx+1 #goes back to prisioner 1
    num_of_sweets -= 1
  end
  prisioners[current_idx-1]

  # current_idx = id
  # candies_left_after_round = num_of_prisioners % num_of_sweets
  # # byebug
  # for i in 1..candies_left_after_round
  #   current_idx = current_idx == num_of_prisioners ? 1 : current_idx+1 #goes back to prisioner 1
  # end
  # current_idx
end

puts "-------Save The Prisoners-------"
puts save_the_prisoner(5,2,1) == 2
puts save_the_prisoner(99, 99, 1) == 99
puts save_the_prisoner(49, 98, 2) == 1
# puts save_the_prisoner(94431605, 679262176, 5284458) == 23525398


##################


# Write a method, #build_power_plants, that will take in two arguments. The
# first of which is the number of cities that need to be powered. The cities
# are arranged in a line and are equidistant from eachother.
#   The second argument will be the range of each powerplant (the number of cities
# in each direction a plant can reach and power). So, a range of 1 means that each
# plant can only reach the cities on either side of it. A range of 0 means that the
# plants can only power the city they are built in.
#
#   Your function should dictate which cities' powerplants need to be built such
# that all of the cities have power, and the least number of cities have powerplants
# as possible.
#
#   Output an array of the cities, with 0 representing a city without a powerplant
# and 1 representing a city with one.
#
# For example:
# build_power_plants(3, 2) means that there are three cities, and each powerplant
# will have a range of two cities. Therefore your function should output the array
# { 0, 1, 0 ]


def build_power_plants(number_of_cities, plant_range)
  cities_with_plants = Array.new(number_of_cities,0)

    if number_of_cities == 1
      return cities_with_plants=[1]
    end

    step_num = 2*plant_range + 1
    0.step(cities_with_plants.length-1,step_num) do |city|
      cities_with_plants[city+plant_range] = 1
    end

    #step_num = 2*plant_power + 1
    #0.step(cities_status.length,step_num)
    #jump the plant_range number of cities. light up the next one. Jump the next plant_range num of cities

  cities_with_plants
end

puts "-------Power Plants-------"
puts build_power_plants(0,1) == []
puts build_power_plants(1,1) == [1]
puts build_power_plants(1,4) == [1]
puts build_power_plants(2,1) == [1, 0] || build_power_plants(2,1) == [0, 1]
puts build_power_plants(2,0) == [1, 1]
puts build_power_plants(3,0) == [1, 1, 1]
puts build_power_plants(3,1) == [0, 1, 0]
puts build_power_plants(3,2) == [1, 0, 0] ||
  build_power_plants(3,2) == [0, 1, 0] ||
  build_power_plants(3,2) == [0, 0, 1]
puts build_power_plants(5,1) == [0, 1, 0, 1, 0] ||
  build_power_plants(5,1) == [1, 0, 0, 1, 0] ||
  build_power_plants(5,1) == [0, 1, 0, 0, 1]
puts build_power_plants(5,2) == [0, 0, 1, 0, 0]
puts build_power_plants(10, 2) == [0, 0, 1, 0, 0, 0, 0, 1, 0, 0]
