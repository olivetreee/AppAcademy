require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)

    # reduce
    # arr.reduce {|sum,el| sum += el}

    accumulator = self.shift if accumulator.nil?

    self.each do |el|
      accumulator = yield(accumulator,el)
    end

    accumulator

  end

end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).to_a.all? {|factor| num%factor != 0}
end

def primes(num)

  result = []
  number = 1
  until result.length == num
    number += 1
    result << number if is_prime?(number)
  end

  result

end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1

  next_fact = factorials_rec(num-1)

  next_fact + [(num-1)*next_fact.last]

end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    result = Hash.new {|h,k| h[k] = []}
    self.each_with_index do |el,idx|
      result[el] << idx if self.count(el) > 1
    end
    result
  end

end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def is_symmetric?(string)

  end

  def symmetric_substrings
    result = []
    self[0..-2].each_char.with_index do |char_1,idx_1|
      substr = char_1
      self[idx_1+1..-1].each_char do |char_2|
        substr+=char_2
        result << substr if substr == substr.reverse
      end
    end
    result
  end

end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.length == 1
    return [] if self.empty?
    # byebug

    middle_index = self.length/2
    left = self.take(middle_index)
    right = self.drop(middle_index)

    left_sorted = left.merge_sort(&prc)
    right_sorted = right.merge_sort(&prc)

    self.class.merge(left_sorted,right_sorted,&prc)
  end

  private
  def self.merge(left, right, &prc)
    prc ||= Proc.new {|x,y| x <=> y}

    merged = []
    until left.empty? || right.empty?
      if prc.call(left.first,right.first) >= 0
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged + left + right

  end
end
