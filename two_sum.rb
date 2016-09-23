require 'byebug'

def bad_two_sum?(arr, target)
  arr[0..-2].each_with_index do |val1, idx1|
    arr[idx1+1..-1].each_with_index do |val2, idx2|
      return true if val1 + val2 == target
    end
  end
  false
end
arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target)
  arr.sort!
  i = 0
  j = arr.length-1

  # byebug
  sum = arr[i] + arr[j]
  until sum == target || i == j
    i += 1 if sum < target
    j -= 1 if sum > target
    sum = arr[i] + arr[j]
  end
  i != j
end

def optimal_two_sum?(arr,target)
  elements_hash = Hash.new()
  arr.each {|el| elements_hash[el] = target - el }
  p elements_hash
  arr.each do |el|
    value = elements_hash[el]
    if value != el
      return true unless elements_hash[value].nil?
    end
  end
  return false
end

arr = [0, 1, 5, 7]
p optimal_two_sum?(arr, 6) # => should be true
p optimal_two_sum?(arr, 10) # => should be false
