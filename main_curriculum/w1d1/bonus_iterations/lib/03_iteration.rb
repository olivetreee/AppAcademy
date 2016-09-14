# factors(num)
#  bubble_sort!(&prc)
#  bubble_sort(&prc)
#  substrings(string)
#  subwords(word, dictionary)

def factors(num)
  result = []
  1.upto(num) do |n|
    result << n if num % n == 0
  end
  result
end

def subwords(word,dictionary)
  result = []
  dictionary.each do |el|
    match_case = Regexp.new(el)
    result << el unless match_case.match(word).nil?
  end
  result
end

class Array
  def bubble_sort!(&prc)
    prc = Proc.new { |x, y| x <=> y } unless block_given?
    sorted = false

    until sorted
      sorted = true
      self.each_with_index do |num_1, idx|
        break if idx == self.length - 1
        num_2 = self[idx + 1]

        if prc.call(num_1, num_2) == 1
          self[idx], self[idx + 1] = num_2, num_1
          sorted  = false
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end
end

# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.

def substrings(str)
  result = []
  str.chars.each_with_index do |char, idx_1|
    substring = char
    result << substring
    ((idx_1 + 1)...str.length).each do |idx_2|
      substring += str[idx_2]
      result << substring
    end
  end
  result
end


#[5,3,1,2,4]
#[3,5,1,2,4]
#[3,1,5,2,4]
