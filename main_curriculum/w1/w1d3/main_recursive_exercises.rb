require 'byebug'

def range(start_num,end_num)
  return [] if end_num < start_num
  return [start_num] if start_num == end_num
  result = []
  result += [start_num] +  range(start_num+1, end_num)
end

def sum_array_recursive(array)
  return array.first if array.length == 1
  array.shift + sum_array_recursive(array)
end

def sum_array_iterative(array)
  array.reduce{|sum,number| sum+= number}
end

def exp_1(base,exp)
  return 1 if exp ==0
  base * exp_1(base,exp-1)
end

def exp_2(base,exp)
  return 1 if exp == 0
  return base if exp == 1

  if exp.even?
    sup_exp = exp_2(base, exp/2)
    sup_exp * sup_exp
  else
    sup_exp = exp_2(base,(exp-1)/2)
    base * (sup_exp * sup_exp)
  end
end

class Array
  def deep_dup
    result = []
    self.each do |ele|
      unless ele.is_a?(Array)
        result << ele
      else
        result << ele.deep_dup
      end
    end
    result
  end
end
#
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
#
# p robot_parts_copy = robot_parts.deep_dup
# robot_parts_copy[1] << "LEDs"
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]



def fibonacci_recursive(n)
  return [0,1] if n == 2
  pre_numbers = fibonacci_recursive(n-1)
  pre_numbers + [pre_numbers[-1] + pre_numbers[-2]]
end

def bsearch(array,target)
  return nil unless array.include?(target)
  return 0 if array.length == 1 && array.first <= target
  return 1 if array.length == 1  && array.first > target

  first_half = array.take(array.length/2)
  second_half = array.drop(array.length/2)
  if target == second_half.first
    first_half.length
  elsif target < second_half.first
    bsearch(first_half,target)
  else
    first_half.length + bsearch(second_half,target)
  end
end

# puts bsearch([1, 2, 3], 1) # => 0
# puts bsearch([2, 3, 4, 5], 3) # => 1
# puts bsearch([2, 4, 6, 8, 10], 6) # => 2
# puts bsearch([1, 3, 4, 5, 9], 5) # => 3
# puts bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# puts bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# puts bsearch([1, 2, 3, 4, 5, 7], 6) # => nil





def merge_sort(array)
  # byebug if array == [3]
  return array if array.length == 1
  # return array if array == array.sort
  first_half = array.take(array.length/2)
  second_half = array.drop(array.length/2)

  sorted_first_half = merge_sort(first_half)
  sorted_second_half = merge_sort(second_half)

  result = sorted_second_half
  sorted_first_half.each do |el_first|
    result = insert_into_array(el_first,result)
  end
  result
end


def insert_into_array(number,array)
  return [number] + array if number < array.first
  return array + [number] if number > array.last
  array.each_with_index do |ele,indx|
    return array[0...indx] + [number] + array[indx..-1] if number < ele
  end
end

# arr = [12,4,1,6,7,3,8,123,901,0,77,92,9,6]
# puts merge_sort(arr)


def subsets(array)
  return [[]] if array.empty?
  # byebug
  pre_subsets = subsets(array[0..-2])
  new_subsets = pre_subsets
  new_subsets = new_subsets.map do |ele|
    ele +=  [array[-1]]
  end
  pre_subsets + new_subsets
end

# arr = [1,2,3]
# p subsets(arr)


def greedy_make_change(value, coins)
  return [] if value == 0 || coins.empty?
  result = []
  while value >= coins.first
    value -= coins.first
    result << coins.first
  end
  result + greedy_make_change(value,coins[1..-1])
end


def make_better_change(value,coins)

  return [] if value == 0

  best_change = nil
  coins.each do |coin|
    next if coin > value #change isn't possible with current coin

    new_value = value - coin
    current_change = make_better_change(new_value,coins)

    next if current_change.nil? #didn't find any possible change

    current_change = [coin] + current_change

    best_change ||= current_change

    if current_change.length < best_change.length
      best_change = current_change
    end

  end

  best_change

end

p make_better_change(10,[6,3])
