require 'byebug'

=begin
STUDENT NOTES
The program below takes the following into consideration:
  • a digraph is a group of consotant+vowel.
    The first goal is to find the first vowel that is not part of a digraph.
  • only one digraph, such as "qu", can appear at the beginning of a word
  • in order to consider more digraphs per word, more use cases are needed
  • a digraph can be followed by a consonant, as in "qubyte"
  • "y" is considered as a vowel sound
  • the capitalization and punctuation are saved
=end

VOWELS = ["a","e","i","o","u","y"]
DIGRAPHS = ["qu"]  #Add more phonemes here

def translate(string)
  words = string.split(" ").map do |word|
    chars = word.chars
    first_vowel_idx = find_first_vowel_idx(chars)

    if vowel_in_digraph?(word,first_vowel_idx) #If the vowel is part of a digraph,
      #it's not a valid vowel. We need to find the next one
      first_vowel_idx = find_first_vowel_idx(chars,first_vowel_idx+1)
    end

    word = translate_word(chars,first_vowel_idx)
  end
  words.join(" ")
end

def translate_word(chars,first_vowel)
  punctuation = stored_punctuation(chars)
  chars.pop if punctuation
  first_vowel.times {chars << chars.shift}
  chars += ["a","y",punctuation]
  word = chars.join
end

def stored_punctuation(chars)
  [",",".","!","?"].each do |punctuation|
    return punctuation if chars.include?(punctuation)
  end
  nil
end

def vowel_in_digraph?(word, start)
  DIGRAPHS.each do |digraph|
    idx = word.downcase.index(digraph)
    return true if idx && idx < start
  end
  false
end

def find_first_vowel_idx(chars,idx=0)
    idx+=1 until VOWELS.include?(chars[idx])
    idx
end
