require 'byebug'
# ------------------------------------------------------------------------------
# Instructions
# ------------------------------------------------------------------------------
# Make sure everything puts out as 'true' when you run the file.
# When time is up, make sure you don't have any unexpected `end`s or infinite loops
# that would keep your code from running.
# Rename the file to be your firstname and lastname.
#
# Do not use the internet.  Do not reference the exercises.  If you forget a
# particular ruby method, write it yourself.
#
# Do not change the parameters passed into the functions in this file.
#
# Test your code with a few cases in addition to the ones we give
# you.  When we grade you, we use different test cases to make sure your logic
# is sound.
#
# Use the debugger when code doesn't run how you expect.
# ------------------------------------------------------------------------------
# Hashtagify
# ------------------------------------------------------------------------------
# Given a sentence string and an array of words, hashtag-ify the words (case-insensitive)
# in the original string and return the updated cool string with hashtags.


def hashtagify(sentence, words)
  #break into words
  #go through each word
  #if words_I_want.include?(word), append # to word. Don't forget to delete special chars
  sentence_words = sentence.split(" ")
  sentence_words.map! do |word|
    word = words.include?(word.downcase.delete("\\-.?,!")) ? "##{word}" : word
  end
  sentence_words.join(" ")

end

puts "-------Hashtagify-------"
puts hashtagify("coding", ["coding"]) == "#coding"
puts hashtagify("coding is fun", ["coding", "fun"]) == "#coding is #fun"
puts hashtagify("Learned about coding. Coding is fun!", ["coding", "fun"]) == "Learned about #coding. #Coding is #fun!"


# Range Summary
# ------------------------------------------------------------------------------
# Given a sorted array of integers without duplicates, return the start and end
# integers of number ranges found in the array. A number range is considered valid
# when all numbers from start to end are contiguous and only increment by 1.
# Assume all numbers are included as part of a range (no stand alone elements).

def range_summary(array)
  #go through each elements.
  #store first elem into start_num
  #if elem[i+1] is > elem[i]+1, that means the next element starts a new range
    #stores start_num and i into tmp_array
    #pushes tmp_array into final_array
    #stores new start_num as i+1
  #
  start_num = array[0]
  tmp_array = []
  ranges_array = []
  for i in 0...array.length
    if array[i+1] != array[i]+1
      tmp_array = start_num,array[i]
      ranges_array << tmp_array
      start_num = array[i+1]
    end
  end
  ranges_array
end

puts "-------Range Summary-------"
puts range_summary([0, 1]) == [[0, 1]]
puts range_summary([0, 1, 4, 5]) == [[0, 1], [4, 5]]
puts range_summary([0, 1, 3, 4, 6, 7]) == [[0, 1], [3, 4], [6, 7]]
puts range_summary([0, 1, 2, 3, 4, 5, 7, 8, 9, 15, 16]) == [[0, 5], [7, 9], [15, 16]]


# Vigenere Cipher
# ------------------------------------------------------------------------------
# Caesar's cipher takes a word and encrypts it by offsetting each letter in
# the word by a fixed number, the key. For a key of 3, for example:
# a -> d, p -> s, and y -> b
#
# Vigenere's Cipher is a Caesar cipher, but instead of a single key, a sequence
# of keys is used. For example, if we encrypt "bananasinpajamas" with the
# key sequence [1, 2, 3], the result would be "ccqbpdtkqqcmbodt":
#
# Word:   b a n a n a s i n p a j a m a s
# Keys:   1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Cipher: c c q b p d t k q q c m b o d t
#
# Write a method that takes a string and a key-sequence, returning
# the encrypted word.

# We're giving you the alphabet as an array if you need it.
# ------------------------------------------------------------------------------

def vigenere_cipher(string, key_sequence, alphabet)
  #char.next will give me the next character in the alphabet
  #CHECK if char is z, as "z".next will give "aa": char = char=="z" ? "a" : char.next
  #
  #key_sequence_index = 0
  #split word into chars
  #go through each of the chars (map!)
    #key_sequence[key_sequence_index].repeat {char = char=="z" ? "a" : char.next}
    #key_sequence_index = key_sequence_index == key_sequence.length-1 ? 0 : key_sequence_index + 1
  #chars.join
  #NOT TAKING INTO CONSIDERATION CAPITAL LETTERS OR PUNCTUATION

  key_sequence_index = 0
  chars = string.split("")
  chars.map! do |char|
    # byebug
    char_offset = key_sequence[key_sequence_index]
    char_offset.times do
      char = char=="z" ? "a" : char.next
    end
    if key_sequence_index == key_sequence.length-1
      key_sequence_index = 0
    else
      key_sequence_index += 1
    end
    char
  end
  chars.join
end

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
puts "----Vigenere cipher----"
puts vigenere_cipher("toerrishuman", [1], alphabet) == "upfssjtivnbo"
puts vigenere_cipher("toerrishuman", [1, 2], alphabet) == "uqftsktjvobp"
puts vigenere_cipher("toerrishuman", [1, 2, 3], alphabet) == "uqhstltjxncq"
puts vigenere_cipher("toarrispirate", [1, 2, 3, 4], alphabet) == "uqdvskvtjtdxf"
puts vigenere_cipher("zzz", [1, 1, 1], alphabet) === "aaa"

# Caesar Guesser
# ------------------------------------------------------------------------------
# Caesar's cipher takes a word and encrypts it by offsetting each letter in
# the word by a fixed number, the key. For a key of 3, for example:
# a -> d, p -> s, and y -> b.
#
# Given that the most common letter in english is 'E', build a decrypter that
# takes an encrypted word, determines the key, and returns the decrypted word.
#
# Strategy: find the most common letter in the encrypted string and assume that it
# should be the letter "e" in the decrypted string. Use this information to
# calculate the key.  Use helper functions to declutter your code.

# We're giving you the alphabet as an array if you need it.
# ------------------------------------------------------------------------------


#helper method to count the most common letter, returning the letter itself
#takes a string
#split the string into chars
#chars.each
#make hash with chars as key and +=1 as value
#return whatever is chars_hash.values.max
def most_common_char(string)
  chars = string.split("")
  char_count = Hash.new(0)
  chars.each do |char|
    char_count[char]+=1
  end

  char_count.each do |char,count|
    return char if count == char_count.values.max
  end

end

def previous_char(char)
  25.times do
    char = char=="z" ? "a" : char.next
  end
  char
end


def caesar_guesser(encrypted_string, alphabet)

#need to count how many times char.previous takes until we match the char we want. That's the key
#call the previous method with 26 - whatever key I find out here
#NOT TAKING INTO CONSIDERATION CAPITAL LETTERS OR PUNCTUATION

  key = 0
  decr_char = ""
  enc_chars = encrypted_string.chars
  e_char = most_common_char(encrypted_string)
  decr_e_char = e_char
  until decr_e_char == 'e'
    #infinite loop here... time's over :(
    # byebug
    decr_e_char = previous_char(decr_e_char)
    key+=1
  end

  decr_string = vigenere_cipher(encrypted_string,[26 - key],alphabet)
end

alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
puts "----Caesar Guesser-----"
puts caesar_guesser("a", alphabet) == "e"
puts caesar_guesser("b", alphabet) == "e"
puts caesar_guesser("ruuauufuh", alphabet) == "beekeeper"
puts caesar_guesser("mnonwmcqntnny", alphabet) == "defendthekeep"
puts caesar_guesser("happdaiawpywga", alphabet) == "letthemeatcake"
puts caesar_guesser("ixxtnnyna", alphabet) == "zookeeper"


# ------------------------------------------------------------------------------
# Finished?
# ------------------------------------------------------------------------------
# Make sure everything puts out as 'true' when you run the file.
# Make sure you don't have any unexpected `end`s or infinite loops
# that would keep your code from running.
#
# Rename the file to be your firstname and lastname.
# ------------------------------------------------------------------------------
