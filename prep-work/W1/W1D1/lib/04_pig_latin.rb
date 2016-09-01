=begin
STUDENT NOTES
The program below takes the following into consideration:
  • a phoneme is the group consotant+vowel. "sch" is simply a group of consonants
    This is done because we find the first vowel that appears and then search for a phoneme.
    If we find one, we know the vowel is part of it, so we must find the next vowel.
    In the end, we'll have a vowel after the first phoneme and any consonants before/after the phoneme
  • only one phoneme, such as "qu", can appear at the beginning of a word
  • in order to consider more phonemes per word, more use cases are needed
  • a phoneme can be followed by a consonant, as in "qubyte"
  • "y" is considered as a vowel sound
  • the capitalization and punctuation are saved
=end

VOWELS = ["a","e","i","o","u","y"]
PHONEMES = ["qu"]  #Add more phonemes here

def translate_word(chars,first_vowel)
  punctuation = stored_punctuation(chars)
  chars.pop if punctuation
  first_vowel.times {chars << chars.shift}
  chars += punctuation ? ["a","y",punctuation] : ["a","y"]
  word = chars.join
end


def stored_punctuation(chars)
  punctuation = [",",".","!","?"]
  punctuation.each do |punct|
    if chars.index(punct)
      return punct
    end
  end
  false
end

def has_phoneme?(word, start)  #A phoneme is a consonant and a vowel
  PHONEMES.each do |phoneme|
    idx = word.downcase.index(phoneme)
    return [idx,phoneme.length] if idx && idx < start
  end
  false
end

def find_first_vowel_idx(chars,idx=0)
    idx+=1 until VOWELS.include?(chars[idx])
    idx
end

def translate(string)
  words = string.split(" ").map do |word|
    chars = word.chars
    first_vowel = find_first_vowel_idx(chars)

    if phoneme = has_phoneme?(word,first_vowel) #If there's a phoneme, the first vowel is part of it, so we need to find the next first vowel
      phoneme_idx, phoneme_length = phoneme
      first_vowel = find_first_vowel_idx(chars,phoneme_idx+phoneme_length) #Start looking for the next first vowel after the phoneme
    end

    word = translate_word(chars,first_vowel)
  end
  words.join(" ")
end
