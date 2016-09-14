def echo(string)
  string
end

def shout(string)
  string.upcase
end

def repeat(string,num=2)
  repeated_string = (string+" ")*num
  repeated_string.strip
end

def start_of_word(string,num)
  string[0,num]
end

def first_word(string)
  string.split(" ").first
end

def titleize(str)
  small_words = ["and", "or", "the", "over"]
  words = str.split(" ")
  first_word = words.shift.capitalize
  capitalized_words = words.map do |word|
    small_words.include?(word) ? word : word.capitalize
  end
  capitalized_words.unshift(first_word).join(" ")
end
