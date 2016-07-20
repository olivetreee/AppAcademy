require 'byebug'


##### PROBLEM HERE
array = [1,2,3,4]

def destroy_array!(array)
  array = []
end

array = [1,2,3,4]

def double_array(original_array)
  doubled_array = original_array
  # (0...original_array.length).each do |index|
  #   doubled_array << original_array[index]
  # end
  doubled_array = [0,9,8,7]
  doubled_array
end

# puts array
# puts "---"
# puts double_array(array)
# puts "---"
# puts array
# puts "----------------"

nyse = "11 Wall Street"

# puts "Old address: #{nyse}"
def get_elected(work_address)
  new_address = work_address
  # puts "I no longer work here: #{new_address}"
  new_address = "1600 Pennsylvania Avenue"
  # puts "Now, I work here: #{new_address}"
end

get_elected(nyse)                                 #=> nil
#puts "New address: #{nyse}"


#Write a function called longest_run_digit(number) that returns the digit that has the longest run of consecutive repeats in a number. For example, longest_run_digit(10555223) should return 5.
def longest_run_digit(number)
  num_counts = Hash.new(0)
  arr_nums = number.to_s.split("")
  arr_nums.each do |num|
    num_counts[num]+=1
  end
  num_counts.each do |num,count|
    return num if count == num_counts.values.max
  end
end

#Write a function called all_word_pairs(string) that given a string, returns an array of every possible pair of words.
def all_word_pairs(string)
  possible_pairs = []
  words = string.split(" ")
  for i in 0...words.length-1
    for j in i+1...words.length
      possible_pairs << [words[i],words[j]]
    end
  end
  possible_pairs
end

#Write a function called any_make_yahtzee?(array) that given an array, determines whether the concatenation of any two strings makes the string "yahtzee".
def any_make_yahtzee?(array)
  for i in 0...array.length-1
    for j in i+1...array.length
      return true if array[i]+array[j]=="yahtzee" || array[j]+array[i]=="yahtzee"
    end
  end
  false
end


#Write a function called clock that cycles through every minute of the day and prints out every half hour. Include the AM and PM.
def clock
  for hour in 0..23
    for minute in 0..59
#      min = "0"*2-minute.to_s.length + minute
      puts "#{hour}:#{minute}" if minute % 30 == 0
    end
  end
end

#Implement bubble sort
def bubble_sort(array)
  #flag is true
  #loop i from 0 till length-1
  #if arr[i] > arr[i+1]
    #swap; flag is false
  swap_tmp = 0
  sorted = true
  for i in 0...array.length-1
    if array[i] > array[i+1]
      swap_tmp = array[i]
      array[i] = array[i+1]
      array[i+1] = swap_tmp
      sorted = false
    end
  end
  bubble_sort(array) unless sorted
  array
end

#Write a function smallest_pair_product that takes an array of integers and returns the
# 2 unique indices whose elements multiply to the smallest number. Formatted [earlier_index, later_index].  Assume none of the elements are 0.


def smallest_pair_product(array)
  product=array[0]*array[1]
  indices=[0,1]
  array.each_with_index do |val_0,key_0|
    array.each_with_index do |val_1,key_1|
      if val_0*val_1 < product && key_0 != key_1
        indices = [key_0,key_1]
        product = val_0*val_1
      end
    end
  end
  indices
end

#Int is not mutable
#Arr are mutable

#Use enumerable methods to add up all the numbers that are not equal to 2 in an array. Do NOT modify the original array.
def add_unless_2(arr)
  arr.reduce do |sum, num|
    num == 2 ? sum : sum+num #If nothing gets returned, sum will be nil
  end
end

#Use the #max_by method to find the longest string in an array of strings.
def longest_string(arr)
  arr.max_by do |string|
    string.length
  end
end

#Write an is_prime? function in one line using enumerable methods.
#Count how many numbers result in %==0. If none, return true
def is_prime?(num)
  (2...num).count {|factor| num%factor==0} == 0 ? true : false
end

#Write a one line function that lists all primes less than or equal to the argument passed in. Use enumerable methods in combination with your is_prime? function.
def list_primes_under(num)
  (1..num).select {|factor| is_prime?(factor)}
end

#Write a function called range_of(array) which returns the difference between the smallest and the greatest value of the array.
def range_of(array)
  sorted_array = array.sort
  sorted_array[-1] - sorted_array[0]
end

#Write a function called greatest_uniq(array) which returns the greatest unique (non-duplicated) number in the array.
def greatest_uniq(array)
  array.uniq.max
end

#Write a function called greatest_three(array) which given an unordered array, returns the greatest three values.
def greatest_three(array)
  sorted_array = array.sort
  [sorted_array[-1],sorted_array[-2],sorted_array[-3]]
end

#Write a function called lotrify(string) translates passages from The Hobbit into the Lord of the Rings. It should replace all occurrences of the string "Bilbo" with the string "Frodo".
def lotrify(string)
  string.gsub('Bilbo','Frodo')
end

#Write an is_palindrome?(string) function that checks to see if the string reads the same backwards as it does forwards. It should not count spaces or be case sensitive.
def is_palindrome?(string)
  normalized_string = string.gsub(" ","").downcase
  normalized_string == normalized_string.reverse
end

#Write a function called longest_palindrome(string) that given a string, finds the longest substring of that string that is a palindrome.
def longest_palindrome(string)
  normalized_string = string.gsub(" ","").downcase
  max_length = 0
  max_pali = ""
  (0...normalized_string.length).each do |index_0|
    pali_string=normalized_string[index_0]
    (index_0+1...normalized_string.length).each do |index_1|
      pali_string+=normalized_string[index_1]
      if is_palindrome?(pali_string) && pali_string.length > max_length
        max_pali = pali_string
        max_length = pali_string.length
      end
    end
  end
  max_pali
end

#Implement bubble sort with parallel assignment
def bubble_sort_par_ass(array)
  #flag is true
  #loop i from 0 till length-1
  #if arr[i] > arr[i+1]
    #swap; flag is false
  swap_tmp = 0
  sorted = true
  for i in 0...array.length-1
    if array[i] > array[i+1]
      array[i],array[i+1] = array[i+1],array[i]
      sorted = false
    end
  end
  bubble_sort(array) unless sorted
  array
end
