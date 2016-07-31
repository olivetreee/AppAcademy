# Longest Definition
# ----------------------------------------
# Write a method #longest_definition, that accepts a hash as an argument. The
# hash should represent a dictionary with words as keys and definitions as values
# (both should be strings). Your method should return the word with the longest
# definition. You should count words, not characters!

def longest_definition(hash)
  longest = hash.max_by {|key,definition| definition.split(" ").length}
  p longest[0]
end

puts "---------Longest Definition----------"
dict1 = { dog: 'human\'s best friend', cat: 'fluffy', humans: 'like dogs' }
dict2 = { word1: 'a srt stnc', word2: 'a_very_loooong_word', word3: 'words!'}
puts longest_definition(dict1) == :dog
puts longest_definition(dict2) == :word1



# ----------------- Switch Roles!



# Skittle Combos
# ----------------------------------------
# You have a bag of skittles. You want to know what every unique
# two-flavor combination tastes like. Write a function that takes in
# a bag of skittles and returns an array of every unique two-flavor
# combination that you could make from the bag, each in its own array.
# Each of the two-flavor arrays should be arranged alphabetically.

def skittle_combos(skittles)
end

puts "---------Skittle Combos----------"
puts (
  skittle_combos(["red", "orange", "green"]).include?(["orange", "red"]) &&
  skittle_combos(["red", "orange", "green"]).include?(["green", "red"]) &&
  skittle_combos(["red", "orange", "green"]).include?(["green", "orange"]))
puts (
  skittle_combos(["purple", "red", "yellow", "green", "red"]).include?(["purple", "red"]) &&
  skittle_combos(["purple", "red", "yellow", "green", "red"]).include?(["purple", "yellow"]) &&
  skittle_combos(["purple", "red", "yellow", "green", "red"]).include?(["green", "purple"]) &&
  skittle_combos(["purple", "red", "yellow", "green", "red"]).include?(["red", "yellow"]) &&
  skittle_combos(["purple", "red", "yellow", "green", "red"]).include?(["green", "red"]) &&
  skittle_combos(["purple", "red", "yellow", "green", "red"]).include?(["green", "yellow"]))
puts skittle_combos(["yellow", "yellow"]) == []
