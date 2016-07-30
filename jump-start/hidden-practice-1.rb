require 'byebug'

# ------------------------------------------------------------------------------
# Instructions
# ------------------------------------------------------------------------------
# This file is in the same format as your assessments.
#
# Make sure everything puts out as 'true' when you run the file.
#
# Give yourself an hour to complete this assessment.
# When time is up, make sure you don't have any unexpected `end`s or infinite loops
# that would keep your code from running.
#
# Rename the file to be your firstname and lastname.
#
# Do not use the internet.  If you forget a particular ruby method, write it yourself.
#
# Test your code with a few cases in addition to the ones we give
# you.  When we grade you, we use different test cases to make sure your logic
# is sound.
#
# Look at the test cases below the problem before you approach it.
# Use the debugger when code doesn't run how you expect.
# ------------------------------------------------------------------------------
#
#
# In All Strings
# ------------------------------------------------------------------------------
# Check if a short_string is a substring of ALL of the long_strings

def in_all_strings?(long_strings, short_string)

  long_strings.each do |string|
    return false unless string.include?(short_string)
  end
  true

end

# puts "---------In All Strings-------"
# puts in_all_strings?(["thisisaverylongstring", "thisisanotherverylongstring"], "sisa") == true
# puts in_all_strings?(["thisisaverylongstring", "thisisanotherverylongstring"], "isan") == false
# puts in_all_strings?(["gandalf", "aragorn", "sauron"], "sam") == false
# puts in_all_strings?(["axe", "ajax", "axl rose"], "ax") == true

# Biodiversity
# ------------------------------------------------------------------------------
# Given an array of specimens, return the biodiversity index, which is defined
# by the following formula: number_of_species^2 times the smallest_population_size
# divided by the largest_population_size.

# In code, biodiversity = number_of_species**2 * smallest_population_size / largest_population_size
#
# ------------------------------------------------------------------------------

def biodiversity_index(specimens)

  population_count = Hash.new(0)
  specimens.each do |species|
    population_count[species]+=1
  end
  species_count = population_count.keys.count
  smallest_population_size = population_count.values.min
  largest_population_size = population_count.values.max
  species_count**2 * smallest_population_size / largest_population_size

end

# puts "------Biodiversity------"
# puts biodiversity_index(["cat"]) == 1
# puts biodiversity_index(["cat", "cat", "cat"]) == 1
# puts biodiversity_index(["cat", "cat", "dog"]) == 2
# puts biodiversity_index(["cat", "fly", "dog"]) == 9
# puts biodiversity_index(["cat", "fly", "dog", "dog", "cat", "cat"]) == 3

# For F's Sake
# ------------------------------------------------------------------------------
# Given a string, return the word that has the letter "f" closest to
# the end of it.  If there's a tie, return the earlier word.  Ignore punctuation.
#
# If there's no f, return an empty string.
# ------------------------------------------------------------------------------


def for_fs_sake(string)
  #word.each
    #word.length.downto(0).with_index do |char,idx|
      #if char.downcase == "f"
        #char_hash[word] = idx
        #break

  f_position = Hash.new("")
  words = string.split(" ")
  # byebug
  words.each do |word|
    word_length = word.length-1
    word_length.downto(0) do |idx|
      if word[idx].downcase == "f"
        f_position[word] = idx
        break
      end
    end
  end
  f_position.each do |word,position|
    return word if position == f_position.values.max
  end
  ""
end

# puts "------For F's Sake------"
# puts for_fs_sake("puff daddy") == "puff"
# puts for_fs_sake("I got a lot of problems with you people! And now you're gonna hear about it!") == "of"
# puts for_fs_sake("fat friars fly fish") == "fat"
# puts for_fs_sake("the French call him David Plouffe") == "Plouffe"
# puts for_fs_sake("pikachu! i choose you!") == ""

# Time Sums
# ------------------------------------------------------------------------------
# Return an array of all the minutes of the day whose digits sum to N.
#
# Use military time, so 1:00 PM is really 13:00 PM.
# ------------------------------------------------------------------------------

def add_1_min(hour,min)
  hour = min==59 ? hour+1 : hour
  min = min==59 ? 0 : min+1
  [hour,min]
end

def time_sums(n)
  matched_sums = []
  for hour in 0..23
    for min in 0..59
      hour_unit = hour%10
      hour_tens = hour/10
      min_unit = min%10
      min_tens = min/10
      digits_sum = hour_unit + hour_tens + min_unit + min_tens
      matched_sums << "#{hour_tens}#{hour_unit}:#{min_tens}#{min_unit}" if digits_sum == n
    end
  end
  matched_sums
end

puts "------Tens Time------"

# puts time_sums(0) == ["00:00"]
# puts time_sums(1) == ["00:01", "00:10", "01:00", "10:00"]
# puts time_sums(23) == ["09:59", "18:59", "19:49", "19:58"]
# puts time_sums(24) == ["19:59"]


# Censor
# ------------------------------------------------------------------------------
# Write a function censor(sentence, curse_words) that censors the words given.
# Replace the vowels in the curse word with "*".

def censor(sentence, curse_words)
  words = sentence.split
  words.map! do |word|
    if curse_words.include?(word.downcase)
      word.gsub(/[aeiouAEIOU]/,"*")
    else
      word
    end
  end
  p words.join(" ")
end

# puts "------Censor------"
# puts censor("Darn you Harold you son of a gun", ["darn", "gun"]) == "D*rn you Harold you son of a g*n"
# puts censor("Schnikeys I don't give a diddly squat", ["schnikeys", "diddly", "squat"]) == "Schn*k*ys I don't give a d*ddly sq**t"
