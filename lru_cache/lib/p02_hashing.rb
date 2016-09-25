# require 'byebug'

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash

    return "array".hash if self.empty?

    size_hash = self.count.hash.to_s.chars.take(1).join
    sum = 0

    self.each_with_index do |ele, idx |
      sum += (ele.hash ^ idx )
    end


    sum = sum.to_s.reverse.chars.take(17).join


    (sum + size_hash).to_i

    # 18 digits
    # 1st digit are for the size of the array, which is an Integer
    # hash every element inside the array
    # add all hashes = a VERY big number
    # if arr.length is odd, we get the first 17 digits of the sum above
    # if arr.length is even, we get the last 17 digits of the sum above

  end
end

class String

  def hash
    sum = 0
    self.each_char.with_index do |char,idx|
      sum += char.ord ^ idx
    end

    sum **= 2 until sum.to_s.length >= 17
    sum = sum.to_s.chars.take(17).join

    size_hash = self.length.hash.to_s.chars.take(1).join
    (sum + size_hash).to_i
  end

end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method

  #puts keys into array + puts vals into array
  #full_arr.map (&subsitute nil with " " &:to_s -> &:ord)
  #sort full arr
  #hash on sorted array
  def hash
    hash_arr = self.keys + self.values
    hash_arr.map! do |ele|
      if ele.nil?
        " ".hash
      elsif ele.class == Symbol
        ele.to_s.hash
      else
        ele.hash
      end
    end

    hash_arr.sort.hash 
  end
end
