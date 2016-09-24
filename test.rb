require 'byebug'

  def hashy(arr)
    # byebug
    return "array".hash if arr.empty?

    size_hash = arr.count.hash.to_s.chars.take(1).join
    sum = 0

    arr.each_with_index do |ele, idx |
      sum += (ele.hash ^ idx)
    end
    if sum.odd?
      sum = sum.to_s.chars.take(17).join
    else
      sum = sum.to_s.reverse.chars.take(17).join
    end

    (size_hash + sum).to_i

    # 18 digits
    # 1st digit are for the size of the array, which is an Integer
    # hash every element inside the array
    # add all hashes = a VERY big number
    # if arr.length is odd, we get the first 17 digits of the sum above
    # if arr.length is even, we get the last 17 digits of the sum above

  end

arr = (1..100).to_a
p hashy(arr)#.to_s.length
