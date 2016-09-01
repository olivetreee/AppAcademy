def add(a,b)
  a+b
end

def subtract(a,b)
  a-b
end

def sum(array)
  return 0 if array.length == 0
  array.reduce {|sum,num| sum+=num}
end

def multiply(*numbers)
  return 0 if numbers.length == 0
  numbers.reduce {|prod,num| prod*=num}
end

def power(base,exp)
  return nil if base == 0 && base == exp
  result = 1
  exp.times {result *= base}
  result
end

def factorial(base)
  prod = 1
  base.downto(1) {|num| prod*=num}
  prod
end
