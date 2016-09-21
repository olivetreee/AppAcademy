require 'byebug'

class Array

  def bubble_sort!(&prc)

    prc = Proc.new {|x,y| x<=>y} unless block_given?

    sorted = false #set to false so we can begin the loop

    until sorted
      sorted = true #assume it's sorted

      self[0...-1].each_index do |i| #go through each element
        j = i+1 #take the element right next to it

        if prc.call(self[i], self[j]) == 1 #if one is greater than the other
          sorted = false  #now I can't assume it's sorted
          self[i], self[j] = self[j], self[i] #sort the pair
        end

      end
    end
    self
  end

  def bubble_sort(&prc)

    new_array = self.dup

    prc = Proc.new {|x,y| x<=>y} unless block_given?

    sorted = false #set to false so we can begin the loop

    until sorted
      sorted = true #assume it's sorted

      new_array[0...-1].each_index do |i| #go through each element
        j = i+1 #take the element right next to it

        if prc.call(new_array[i], new_array[j]) == 1 #if one is greater than the other
          sorted = false  #now I can't assume it's sorted
          new_array[i], new_array[j] = new_array[j], new_array[i] #sort the pair
        end

      end
    end
    new_array
  end

  def quick_sort!(&prc)
    return self if self.length <= 1 #base case: when an array is a single element, it's sorted

    prc = Proc.new {|x,y| x<=>y} unless block_given?

    pivot = self.first #Define a pivot element

    left_side = self[1..-1].select do |el|
      prc.call(pivot,el) >= 0 ? true : false  #whatever the block wants to go to the left
    end

    right_side = self[1..-1].select do |el|
      prc.call(pivot,el) == -1 ? true : false #whatever the block wants to go to the right
    end

    self.length.times {self.delete_at(0)}

    result = left_side.quick_sort(&prc) + [pivot] + right_side.quick_sort(&prc) #inductive step

    result.each {|el| self << el}
    self

  end

  def quick_sort(&prc)
    return self if self.length <= 1 #base case: when an array is a single element, it's sorted

    prc = Proc.new {|x,y| x<=>y} unless block_given?

    pivot = self.first #Define a pivot element

    left_side = self[1..-1].select do |el|
      prc.call(pivot,el) >= 0 ? true : false  #whatever the block wants to go to the left
    end

    right_side = self[1..-1].select do |el|
      prc.call(pivot,el) == -1 ? true : false #whatever the block wants to go to the right
    end

    left_side.quick_sort(&prc) + [pivot] + right_side.quick_sort(&prc) #inductive step

  end

  def merge_sort!(&prc)
    return self if self.length == 1

    split_number = self.length/2
    first_half = self.take(split_number)
    second_half = self.drop(split_number)

    first_solved = first_half.merge_sort(&prc)
    second_solved = second_half.merge_sort(&prc)

    self.length.times {self.delete_at(0)}

    result = merge_arrays(first_solved, second_solved, &prc)
    result.each {|el| self << el}
    self
  end

  def merge_sort(&prc)
    return self if self.length == 1

    split_number = self.length/2
    first_half = self.take(split_number)
    second_half = self.drop(split_number)

    first_solved = first_half.merge_sort(&prc)
    second_solved = second_half.merge_sort(&prc)

    merge_arrays(first_solved, second_solved, &prc)
  end

  def merge_arrays(arr1, arr2, &prc)
    result = []
    prc = Proc.new {|x,y| x<=>y} unless block_given?

    until arr1.empty? || arr2.empty?
      if prc.call(arr1.first,arr2.first) == 1
        result << arr2.shift
      else
        result << arr1.shift
      end
    end

    result + arr1 + arr2
  end

  def select_sort
    return self if self.length == 1

    min_element_idx = self.index(self.min)
    self[0], self[min_element_idx] = self[min_element_idx], self[0]
    [self[0]] + self[1..-1].select_sort
  end

  def insert_sort(&prc)
    #save, delete, insert
    prc = Proc.new {|x,y| x<=>y} unless block_given?

    (1...self.length).each do |idx|
      current_element = self[idx]
      checking_index = idx-1
      checking_element = self[checking_index]

      until checking_index < 0 ||
        prc.call(current_element, checking_element) == 1
        checking_index -= 1
        checking_element = self[checking_index]
      end

      checking_index+=1 #because #insert inserts before the passed index
      self.insert(checking_index, self.delete_at(idx))
    end
    self
  end

end


class String

  def jumble_sort(alphabet= nil)
    alphabet ||= ("a".."z").to_a

    result = ""
    alpha_indexes = []
    self.each_char.with_index do |char,idx|
      alpha_indexes << alphabet.index(char)
    end

    alpha_indexes.sort.each do |idx|
      result += alphabet[idx]
    end

    result

  end

end

def first_even_numbers(n)
  return [0] if n == 1

  first_even_numbers(n-1) + [2*(n-1)]

end

def first_even_numbers_sum(n)
  return 2 if n == 1

  first_even_numbers_sum(n-1) + 2*n

end

def first_odd_numbers(n)
  return [1] if n == 1

  first_odd_numbers(n-1) + [2*n-1]

end

def factorial_number(n)
  return 1 if n == 1

  n * factorial_number(n-1)

end

def first_factorial_numbers(n)
  return [1] if n == 1

  first_factorial_numbers(n-1) + [n*first_factorial_numbers(n-1).last]
end

def first_factorial_numbers_sum(n)
  return 1 if n == 1
  # byebug



end

def factorials_sum(n)
  return 1 if n == 1
  return 3 if n == 2

  # a1 = factorials_sum(n-1)
  # a2 = factorials_sum(n-2)
  # a1 + (a1 - a2)*n;


end

def subsets(array)
  # byebug
  return [[]] if array.empty?
  subs = subsets(array.take(array.count - 1))
  subs + subs.map { |sub| sub + [array.last] }
end





arr = [1,2,3]
p subsets(arr)

# arr = [6,2,3,65,1,4,7,8,2,43,6,4]
# # p arr.quick_sort {|x,y| y<=>x}
# p arr.quick_sort! {|x,y| y<=>x}
# p arr
