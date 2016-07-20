require 'byebug'

#Write a function first_n_evens(n) that returns an array of the first N many even numbers, starting from 0.
def first_n_evens(n)
  0.step(n,2) do |x|
    puts x
  end
end

def reverse(arr)
  return arr.reverse
end


#Write a function rotate(array, shift) that given an array, rotates it in-place by the shift amount. E.g., rotate([1, 2, 3, 4, 5], 2) should produce [4, 5, 1, 2, 3]. rotate([5, 6, 7], -1) should produce [6, 7, 5].
def rotate(arr,shift)
  i=0
  #if >0, pop -> unshift
  #if <0, shift -> push
  if shift > 0
    while i<shift do
      arr.unshift(arr.pop)
      i+=1
    end
  else
    shift *= -1
    while i<shift
      arr.push(arr.shift)
      i+=1
    end
  end

  return arr
end

#Write a function all_uniqs(array1, array2) that given two arrays, produces a new array of only elements unique to array1 and elements unique to array2. E.g., all_uniqs([2, 5, 7], [1, 2, 7]) should return [1, 5]
def all_uniqs(arr_1,arr_2)
  return arr_1.select{|elem| arr_2.include?(elem)}
end


#Write a function called vowels(string) that returns an array of every vowel in the string.
def vowels(str)
  arr=[]
  vwl = ["a","e","i","o","u"]
  str.chars.each do |char|
    arr << char if vwl.include?(char)
  end
  return arr
end


#Write a function called odd_elements(array) that prints out every other element (those with odd indices). Use each_with_index.
def odd_elements(arr)
  arr.each_with_index do |elem,idx|
    next if idx%2==0
    puts elem
  end
end

#Write a function called zip_with_indices(array) that given an array, converts each element into a tuple (array with two items) with its index.
def zip_with_indices(arr)
  return arr.zip([*0...arr.length]) #[*0..10] creates an array from 0 to 10, included
end


def is_prime?(num)
  i=num-1
  while i>=2
    return false if num%i==0
    i-=1
    end
  return true
end


#while true
#check if i is prime
#if so, push to arr
#increment counter
#break if counter == n
def first_n_primes(n)
  i=1
  counter = 0
  arr=[]
  while true
    if is_prime?(i)
      arr << i
      counter+=1
    end
    break if counter == n
    i+=1
  end
  return arr
end


def calculate_tip(bill)
  if bill < 5
    return 1
  elsif bill < 10
    return bill * 0.18
  else
    return bill * 0.13
  end
end


def nth_biggest_prime(nth)
  prime_counter = 0
  num = 2
  while true
    if is_prime?(num)
      prime_counter += 1
      return num if prime_counter == nth
    end
    num += 1
  end
end
