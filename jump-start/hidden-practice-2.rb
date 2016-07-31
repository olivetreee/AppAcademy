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

# Price is Right
# ------------------------------------------------------------------------------
# Given a list of bids and an actual retail price, return the bid that is closest
# to the actual retail price without going over that price.
#
# Assume there is always at least one bid below the retail price.

def price_is_right(bids, actual_retail_price)
  #need to store dif. If at any time dif is smaller, store new dif
  valid_bids = bids.select {|bid| bid<=actual_retail_price}
  closest_bid = valid_bids[0]
  closest_bid_diff = actual_retail_price-valid_bids[0]
  valid_bids.each do |bid|
    bid_diff = actual_retail_price - bid
    if bid_diff < closest_bid
      closest_bid_diff = bid_diff
      closest_bid = bid
    end
  end

  closest_bid

end

puts "-------Price is Right-------"
puts price_is_right([200, 2350, 1400, 1600], 1599) == 1400
puts price_is_right([950, 850, 1000, 1], 1300) == 1000


# Total Product Sequence
# ------------------------------------------------------------------------------
# The total product sequence starts with [1, 2, 3] as a "base case" (what you
# start with).  The next number in the sequence is the product of all the numbers
# before it.  Given a number n, find the nth number of the total product sequence.
#
# Assume n must be at least 1

def total_product_sequence(n)
  #n.repeat and keep pushing the reduced result

  #define base_array
  #(n-3).times
  #push the result of the reduce prod*num
  #return base_array[n-1], so that it returns even if n is 1, 2 or 3

  base_array = [1,2,3]
  (n-3).times do
    array_elems_prod = base_array.reduce {|prod,num| prod*=num}
    base_array << array_elems_prod
  end

  base_array[n-1]

end

puts "-------Total Product Sequence-------"
puts total_product_sequence(1) == 1
puts total_product_sequence(2) == 2
puts total_product_sequence(3) == 3
puts total_product_sequence(4) == 6 # 3 * 2 * 1
puts total_product_sequence(5) == 36 # 6 * 3 * 2 * 1
puts total_product_sequence(6) == 1296 # 36 * 6 * 3 * 2 * 1
puts total_product_sequence(8) == 2821109907456 # etc...

# Products Except Me
# ------------------------------------------------------------------------------
#
# Given an array of numbers, calculate all the different products that remain when
# you take each element out of the array.
#
# Examples:
#
# [2, 3, 4] => [12, 8, 6], where:
#   12 because you take out 2, leaving 3 * 4
#   8, because you take out 3, leaving 2 * 4
#   6, because you take out 4, leaving 2 * 3
# ]
#
# [1, 2, 3, 5] => [30, 15, 10, 6], where:
#   30 because you take out 1, leaving 2 * 3 * 5
#   15, because you take out 2, leaving 1 * 3 * 5
#   10, because you take out 3, leaving 1 * 2 * 5
#   6, because you take out 5, leaving 1 * 2 * 3
# ]
#
#
#

def pop_elem_from_array (array,idx)
  array[0...idx] + array[idx+1..-1]
end

def products_except_me(numbers)
#helper method do slice num from array, return a new array
#reduce the new array and push it to a prod_array
  prod_array = []
  numbers.each_with_index do |num,idx|
    new_array = pop_elem_from_array(numbers, idx)
    new_array_prod = new_array.reduce { |prod,num| prod*=num }
    prod_array << new_array_prod
  end
  prod_array
end

puts "-------Products Except Me-------"
puts products_except_me([2, 3, 4]) == [12, 8, 6]
puts products_except_me([1, 2, 3, 5]) == [30, 15, 10, 6]
puts products_except_me([7, 2, 1, 4]) == [8, 28, 56, 14]


# Fall and Winter Birthdays
# ------------------------------------------------------------------------------
# Given a list of students and what month their birthday is, return all the pairs
# of students whose birthdays both fall in the second half of the year.  Months
# are numbers, and assume that July (month 7) and later is the second half of
# the year.
#
# Only count pairs once, and work from the beginning of the list to the end.
#

def delete_first_half (students)
  students.delete_if {|student,month| month < 7}
end

def fall_and_winter_birthdays(students_with_birthdays)
  students_pairs = []
  students_hash = students_with_birthdays.to_h
  students_bday_2nd_half = delete_first_half(students_hash).to_a
  for i in 0...students_bday_2nd_half.length-1
    for j in i+1..students_bday_2nd_half.length-1
      students_pairs << [students_bday_2nd_half[i][0],students_bday_2nd_half[j][0]]
    end
  end
  students_pairs
end

students_with_birthdays_1 = [
  ["Asher", 6],
  ["Bertie", 11],
  ["Dottie", 8],
  ["Warren", 9]
]

second_half_birthday_pairs_1 = [
  ["Bertie", "Dottie"],
  ["Bertie", "Warren"],
  ["Dottie", "Warren"]
]

students_with_birthdays_2 = [
  ["Asher", 6],
  ["Bertie", 11],
  ["Dottie", 8],
  ["Warren", 9],
  ["Charlie", 7],
  ["Nassim", 4],
  ["Ajit", 10],
]

second_half_birthday_pairs_2 = [
  ["Bertie", "Dottie"],
  ["Bertie", "Warren"],
  ["Bertie", "Charlie"],
  ["Bertie", "Ajit"],
  ["Dottie", "Warren"],
  ["Dottie", "Charlie"],
  ["Dottie", "Ajit"],
  ["Warren", "Charlie"],
  ["Warren", "Ajit"],
  ["Charlie", "Ajit"],
]

puts "-------Fall and Winter Birthdays-------"
puts fall_and_winter_birthdays(students_with_birthdays_1) == second_half_birthday_pairs_1
puts fall_and_winter_birthdays(students_with_birthdays_2) == second_half_birthday_pairs_2


# More than N Factors
# ------------------------------------------------------------------------------
# Given an array of numbers, return all the numbers that have at least N
# factors (including 1 and itself as factors).

# For example, if you were given [1, 3, 10, 16] and wanted to find the numbers
# that had at least five factors, you would return [16] because 16 has five
# factors (1, 2, 4, 8, 16) and the others have fewer than five factors.

def more_than_n_factors(numbers, n)
  #need to find all factors. count and then delete what's smaller than n
  #numbers.each
    #n.downto(1) |num|
      #if n%num == 0 increment factor counter
    #num_hash[num] = counter
  # delete all that are counter < n

  factors_count = Hash.new(0)
  numbers.each do |num|
    num.downto(1) do |factor|
      factors_count[num] += 1 if num%factor == 0
    end
  end
  factors_count.delete_if {|num,count| count < n}
  factors_count.keys
end

puts "-------More Than N Factors-------"
puts more_than_n_factors([1, 3, 10, 16], 5) == [16]
puts more_than_n_factors([1, 3, 10, 16], 2) == [3, 10, 16]
puts more_than_n_factors([20, 36, 39, 16], 6) == [20, 36]


# One-week Wonders
# ------------------------------------------------------------------------------
# Given a list of songs at the top of the charts, return the songs that only
# stayed on the chart for a week at a time.
#
# Songs CAN reappear on the chart, as long as it's for a week at a time. Only
# count those songs once.
#
# Suggested strategy: find the songs that show up multiple times in a row and
# subtract them out.

def delete_songs(songs,songs_to_delete)
  songs_to_delete.each do |song_to_delete|
    songs.delete_if {|song,v| song == song_to_delete}
  end
  songs
end

def one_week_wonders(songs)
  #store songs into hash so you can delete_if key matches an array to_be_deleted
  #compare array[i] with array[i+1]. if they're equal, store song into an array to_be_deleted and
  #also, increment i so you skip the array[i+1] since it's been accounted for
  #call helper function to delete the songs
  #print the remaining array.uniq

  to_be_deleted = []
  songs_hash = Hash.new(0)
  songs.each { |song| songs_hash[song]=0}
  for i in 0...songs.length-1
    if songs[i] == songs[i+1]
      to_be_deleted << songs[i]
      i+=1
    end
  end
  songs = delete_songs(songs_hash,to_be_deleted)
  songs.keys

end

top_hits_1 = ["Call Me Maybe", "Protect Ya Neck", "Call Me Maybe", "Protect Ya Neck", "Protect Ya Neck"]
one_week_wonders_1 = ["Call Me Maybe"]

top_hits_2 = ["Beat It", "Beat It", "Careless Whisper", "Beat It", "Baby", "Baby", "Never Gonna Give You Up", "Uptown Funk", "Uptown Funk", "Uptown Funk"]
one_week_wonders_2 = ["Careless Whisper", "Never Gonna Give You Up"]

puts "-------One Week Wonders-------"
puts one_week_wonders(top_hits_1) == one_week_wonders_1
puts one_week_wonders(top_hits_2) == one_week_wonders_2

# Sign Tweakers
# ------------------------------------------------------------------------------
# Given a perfectly respectable business sign, determine if pranksters George
# and Harold can make a vandalized sign out of it using the same or fewer letters.
# Ignore capitalization and punctuation.

def char_counter_hash(string)
  char_count = Hash.new(0)
  string.each_char do |char|
    char_count[char]+=1
  end
  char_count

end

def can_tweak_sign?(normal_sign, vandalized_sign)
  #This is basically a count the chars problem
  #do a gsub first to get rid of punctuation. then do a downcase
  #helper method that transforms both signs into a hash[char]=count
  #compare the two hashes: if vandalized[char] <= normal[char] we're game

  normal_sign = normal_sign.gsub(/[.?!]/,"").downcase
  vandalized_sign = vandalized_sign.gsub(/[.?!]/,"").downcase

  normal_char_counter = char_counter_hash(normal_sign)
  vandalized_char_counter = char_counter_hash(vandalized_sign)

  vandalized_char_counter.each do |char,count|
    return false if count > normal_char_counter[char]
  end
  true

end

puts "-------Sign Tweakers-------"
puts can_tweak_sign?("Come in and see our pretty armchairs", "Come and see our hairy armpits") == true
puts can_tweak_sign?("Student and teacher art fair starts Wed.", "Teacher farts stain underwear") == true
puts can_tweak_sign?("Choose the bread of life or you are toast", "Teacher farts stain underwear") == false


# Repeated Number Ranges
# ------------------------------------------------------------------------------
# Given a list of numbers, give the start and end indices each time a number shows
# up multiple times in a row.
#

def repeated_number_ranges(numbers)
  #go through numbers
  #compare with next
    #if equal and sequence==false, store the index_start and sequence = true
    #if dif and sequence==true, store the index_end and sequence = false
  #ranges << start,end

  ranges = []
  sequence = false
  # byebug
  for i in 0..numbers.length-1
    if numbers[i] == numbers[i+1] && sequence == false
      index_start = i
      sequence = true
    end
    if numbers[i] != numbers[i+1] && sequence == true
      index_end = i
      ranges << [index_start,index_end]
      sequence = false
    end
  end
  ranges
end

puts "-------Repeated Number Ranges-------"
puts repeated_number_ranges([1, 1, 2]) == [[0, 1]]
puts repeated_number_ranges([1, 2, 3, 3, 4]) == [[2, 3]]
puts repeated_number_ranges([1, 2, 3, 3, 4, 4]) == [[2, 3], [4, 5]]
puts repeated_number_ranges([1, 1, 1, 2, 3, 3, 4]) == [[0, 2], [4, 5]]
puts repeated_number_ranges([8, 7, 7, 14, 12, 12, 12, 12, 21]) == [[1, 2], [4, 7]]
