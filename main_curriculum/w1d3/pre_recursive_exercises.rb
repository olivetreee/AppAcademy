def sum_to(n)
  return nil if n<0
  return n if n == 1
  n + sum_to(n-1)
end

# Test Cases
puts sum_to(5) == 15 # => returns 15
puts sum_to(1) == 1 # => returns 1
puts sum_to(9) == 45  # => returns 45
puts sum_to(-8)  == nil # => returns nil
puts "*****"

def add_numbers(nums_array = [])
  return nil if nums_array.empty?
  return nums_array.first if nums_array.length <=1

  nums_array.pop + add_numbers(nums_array)
end

# Test Cases
puts add_numbers([1,2,3,4]) == 10 # => returns 10
puts add_numbers([3]) == 3# => returns 3
puts add_numbers([-80,34,7]) == -39 # => returns -39
puts add_numbers() == nil # => returns nil
puts "*****"

def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1

  (n-1) * gamma_fnc(n-1)
end

# Test Cases
puts gamma_fnc(0) == nil # => returns nil
puts gamma_fnc(1) == 1 # => returns 1
puts gamma_fnc(4) == 6 # => returns 6
puts gamma_fnc(8) == 5040  # => returns 5040
