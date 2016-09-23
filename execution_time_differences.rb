def my_min(list)
  min = list.first
  list[1..-1].each do |element|
    min = element if element < min
  end
  p min
end

def my_bad_min(list)
  list = list.select do |el1|
    list.all? do |el2|
      el1 <= el2
    end
  end
  p list.first
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_bad_min(list)  # =>  -5
# my_min(list)

def largest_contiguous_subsum(list)

  subsets = get_contiguous_subsets(list)

  subsets.map! do |subset|
    subset.reduce(:+)
  end
  p subsets.max
end

def get_contiguous_subsets(list)
  subsets = []
  0.upto(list.length-1) do |i|
    0.upto(list.length-1) do |j|
      subsets << list[i..j] if j > i
    end
  end
  subsets

  # return [[]] if list.length == 0
  # result = []
  # previous_list = get_contiguous_subsets(list[0..-2])
  # previous_list.each do |el|
  #   result << el + [list.last]
  # end
  # previous_list + result
end

def get_cont_sums(list)
  # max = list.max
  # max_index = list.index(max)
  # max_sum = max
  # sum = 0
  # (max_index).downto(0) do |index|
  #   sum += list[index]
  #   max_sum = sum if sum > max_sum
  # end
  # sum = 0
  # (max_index).upto(list.length-1) do |index|
  #   sum += list[index]
  #   max_sum = sum if sum > max_sum
  # end
  # return max_sum
  max_sum = nil
  sum = 0
  list.each do |num|
    sum += num
    sum = 0 if sum < 0
    max_sum = sum if max_sum == nil || sum > max_sum
  end
  max_sum
end
# list = [5, 3, -7
# list = [2, 3, -6, 7, -6, 7]
list = [6, -5, 4, -1000, 3, 3, 3, 3, 3]
# largest_contiguous_subsum(list) # => 8

p get_cont_sums(list)
