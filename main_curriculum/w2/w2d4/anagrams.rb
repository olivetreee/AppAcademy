def anagram_1?(string1, string2) #n!
  possible_anagrams = string1.split('').permutation(string1.length)
  .map {|anagram| anagram.join('')}
  possible_anagrams.include?(string2)
end

def anagrams_2?(string1, string2) #nˆ2

  string1 = string1.split('')
  string2 = string2.split('')

  string1.length.times do
    return false if string2.delete(string1[0]).nil?
    string1.delete_at(0)
  end
  string1.empty? && string2.empty?
end

def anagrams_3?(string1, string2)
  string1.split("").sort == string2.split('').sort
end

def anagrams_4?(str1,str2)
  char_hash = Hash.new { |hash, key| hash[key] = [[],[]] }
  str1.each_char {|char| char_hash[char][0] << 0}
  str2.each_char {|char| char_hash[char][1] << 0}
  repeated_letters = char_hash.values.select {|val| val[0].length == val[1].length}
  repeated_letters.length == str1.length
end

p anagrams_4?("gizmo", "sally")    #=> false
p anagrams_4?("elvis", "lives")    #=> true
