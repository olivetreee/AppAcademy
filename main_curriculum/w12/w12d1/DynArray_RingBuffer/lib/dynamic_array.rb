require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.capacity = 8
    self.length = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    self.store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    self.store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if self.length == 0

    self.length -= 1
    popped_val = self.store[self.length]
    self.store[self.length] = nil
    popped_val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    self.resize! if self.length == self.capacity

    self.store[self.length] = val
    self.length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if self.length == 0

    shifted_element = self.store[0]

    self.length -= 1

    (1..length).each { |idx| self.store[idx-1] = self.store[idx] }

    shifted_element

  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    self.resize! if self.length == self.capacity

    (self.length-1).downto(0) do |idx|
      self.store[idx + 1] = self.store[idx]
    end

    self.length += 1
    self.store[0] = val

  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if (index < 0 || index >= length)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_capacity = self.capacity * 2
    new_store = StaticArray.new(new_capacity)
    length.times { |idx| new_store[idx] = self[idx] }

    self.store = new_store
    self.capacity = new_capacity
  end
end
