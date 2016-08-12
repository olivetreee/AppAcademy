require 'byebug'

# chunk an array into nested arrays of length n
def chunk(array, n)
  new_array=[]
  0.step(array.length-1,n) do |index|
    tmp_array=[]
    for i in index...index+n
      tmp_array << array[i] if i <= array.length-1
    end
    new_array << tmp_array
  end
  p new_array
end

# puts "---------chunk-------"
# puts chunk([1, 8, 9, 4, "hey", "there"], 2) == [[1, 8], [9, 4], ["hey", "there"]]
# puts chunk([10, 9, 8, 7, 6, 5, 4], 3) == [[10, 9, 8], [7, 6, 5], [4]]

# Translate into pig-latin! First consonants go to the end of a word. End with "ay"

def char_to_end(arr,n)
  n.times do
    char = arr.shift
    arr << char
  end
  arr
end

def pig_latin(sentence)
  #split into words, then do words.each |word|
    #split words into char, then do chars.each (break if char is vowel)
      #shift and push
    #push ay to end of word
    #chars.join
  #words.join(" ")

  vowels = ['a','e','i','o','u']
  words = sentence.split(" ")
  pig_latin_array = []
  words.each do |word|
    char_shifts = 0
    chars = word.chars
    chars.each do |char|
      break if vowels.include?(char)
      char_shifts += 1
    end
    char_to_end(chars,char_shifts)
    chars << "ay"
    pig_latin_array << chars.join
  end
end

# puts "---------pig latin-------"
# puts pig_latin("i speak pig latin") == "iay eakspay igpay atinlay"
# puts pig_latin("throw me an aardvark") == "owthray emay anay aardvarkay"

# Remove the nth letter of the string
def remove_nth_letter(string, n)
  #arr.length + n if n<0
  n = string.length + n if n<0
  chars = string.chars
  new_string = []
  new_string << chars[0..n-1] << chars[n+1..-1]
  new_string.join
end

# puts "---------remove nth letter-------"
# puts remove_nth_letter("helloworld", 5) == "helloorld"
# puts remove_nth_letter("helloworld", -3) == "hellowold"

# Boolean function: check if short_string is a substring of long_string
def substring?(long_string, short_string)
  long_string.include?(short_string)
end

# puts "---------substring-------"
# puts substring?("thisisaverylongstring", "sisa") == true
# puts substring?("thisisaverylongstring", "ting") == false
# puts substring?("whatifikeptontypingforever", "ik") == true

# count the number of times that two adjacent numbers in an array add up to n.
# You cannot reuse a number. So count_adjacent_sums([1, 5, 1], 6) => 1

def count_adjacent_sums(array, n)
  #create array of used numbers. push the ones that have been Used
  #sum only if used_nums.include?(num) is false

  used_nums=[]
  num_count=0
  for index in 0...array.length-1
    unless used_nums.include?(array[index]) && used_nums.include?(array[index+1])
        if array[index]+array[index+1] == n
          used_nums << array[index] << array[index+1]
          index+=1 #I just used array[index+1], so I can skip it
          num_count+=1
        end
    end
  end
  num_count

end

# puts "---------count adjacent sums-------"
# puts count_adjacent_sums([7, 2, 4, 6, 8, 10], 7) == 0
# puts count_adjacent_sums([6, 7, 11, 2, 5, 10, 3], 13) == 3
# puts count_adjacent_sums([1, 9, 1, 8, 2, 10], 10) == 2

# update the older inventory with the newer inventory. Add any new items to the
# hash and replace the values for items that already exist.

def inventory_hash(older, newer)
  present_inventory = older
  newer.each do |item,count|
    present_inventory[item] = count
  end
  present_inventory
end

# puts "---------inventory hash-------"
# march = {rubies: 10, emeralds: 14, diamonds: 2}
# april = {emeralds: 27, moonstones: 5}
# puts inventory_hash(march, april) == {rubies: 10, emeralds: 27, diamonds: 2, moonstones: 5}

# Now, alphabetical order matters in your inventory. Insert new inventory items into
# your array in the appropriate place

def inventory_hash_from_array(older, newer)
  present_inventory = Hash.new(0)
  older.each do |item|
    present_inventory[item[0]] = item[1]
  end
  newer.each do |item|
    present_inventory[item[0]] = item[1]
  end
  present_inventory
end

def inventory_array(older, newer)
  present_inventory = inventory_hash_from_array(older,newer) #returns a hash with updated count
  alpha_inventory = present_inventory.sort_by{|item,count| item}

end

# puts "---------inventory array-------"
# march_array = [['diamonds', 2], ['emeralds', 14], ['rubies', 10]]
# april_array = [['emeralds', 27], ['moonstones', 5]]
# puts inventory_array(march_array, april_array) == [['diamonds', 2], ['emeralds', 27], ['moonstones', 5], ['rubies', 10]]
