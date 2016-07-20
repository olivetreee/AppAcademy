require 'byebug'

def code_errors



#undefined method `mpa' for []:Array
#arr=[]
#arr.mpa

#NoMethodError: undefined method `+' for nil:NilClass
#arr=[1,2]
#return arr[2]+1

#NameError: undefined local variable or method `n' for main:Object
#return num

#unexpected keyword_end, expecting end-of-input
#end

end
#Initialize an array of 100 elements with a default value of "yes", and then set every other value to "no".
def yes_no_array
  arr = Array.new(100,'YES')
  arr.each_with_index do |elmnt,idx|
    arr[idx] = 'NO' if idx%2==0
  end
  puts arr[90..-1]
end

#Write a function called letters_before(character) that given a character in the alphabet, returns all of the characters that go before it in the alphabet.
def letters_before(char)
  return ('a'..char).to_a
end

#Write a function called to_range(array) that given an ordered array of every value from start_number to end_number, returns the corresponding range.
#For example, the to_range([4, 5, 6, 7] should return (4..7) as a range.
def to_range(arr)
  start_num = arr[0]
  end_num = arr[-1]
  return (start_num..end_num)
end

#Write a function called triplify(array) which given an array of integers, returns a new array with all of the values multiplied by three.
def triplify(arr)
  arr.map{|elem|
    elem*3}
end

#Write a boolean function called zeroes?(array) that checks whether an array of integers contains at least one 0.
def zeroes?(arr)
  return arr.any? do |num|
    num == 0
  end
  # arr.each do |num|
  #   return true if num == 0
  # end
  # return false
end

#Write a function called all_odd?(array) that returns whether all of the integers in an array are odd.
def all_odd?(arr)
  return arr.all? do |num|
    num%2!=0
  end
end

#Write a function called squares(array) that, given an array of integers, returns a new array of each number squared.
def squares(arr)
  return arr.map {|num| num**2 }
end

#Write a function called word_lengths(string) that given a sentence, returns a hash of each of the words and their lengths.
def word_lengths(str)
  #hash={key => value}
  #split str into arr
  #arr.each do |elem| hash_str={elem => elem.length}
  hash_str={}
  arr = str.split(' ')
  arr.each do |elem|
    hash_str[elem] = elem.length
  end
  return hash_str
end

#Write a function called uniq(array) that returns an array with only the unique values in the array. (Hint: use a hash!)
def uniq(array)
  hash_arr={}
  array.each do |elem|
    hash_arr[elem] = 0  #It doesn't matter what they're assigned to.
  end
  return hash_arr.keys
end

#Write a function called greatest_val_key(hash) that takes in a hash with any keys but only integers for values, and returns the key with the largest value.
def greatest_val_key(hash)
  hash.each do |key,value|
    puts key if value == hash.values.max
  end
end

#Write a function called most_common_number(array) that takes an array, and returns the number that appears the most times. If there's a tie, just return one of the tied people.
def most_common_number(array)
  tmp = Hash.new(0) #Need to set to default so the sum can happen. If not, will try to do nil + 1
  array.each do |elem|
    tmp[elem] += 1
  end
  tmp.each do |key,val|
    return key if val == tmp.values.max
  end
end

#Write a function called least_frequent_word(string) that takes in a string, and returns the word repeated most infrequently.
def least_frequent_word(str)
  tmp = Hash.new(0)
  arr_str = str.split(" ")
  arr_str.each do |elem|
    tmp[elem] += 1
  end
  tmp.each do |key,val|
    return key if val == tmp.values.min
  end
end
