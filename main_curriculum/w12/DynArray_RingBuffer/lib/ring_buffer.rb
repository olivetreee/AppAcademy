require "byebug"
require_relative "static_array"

class RingBuffer
# This works by making the DynamicArray a circular array. There's a start_idx, which is like a virtual [0]. It makes shift and unshift O(1)


  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.capacity = 8
    self.length = 0
    self.start_idx = 0

  end

  # O(1)
  def [](index)
    check_index(index)

    ring_index = (index + self.start_idx) % self.capacity
    self.store[ring_index]
  end

  # O(1)
  def []=(index, val)
    check_index(index)

    ring_index = (index + self.start_idx) % self.capacity
    self.store[ring_index] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if self.length == 0

    popped_value = self[self.length-1]
    self[self.length-1] = nil
    self.length -= 1

    popped_value

  end

  # O(1) ammortized
  def push(val)
    self.resize! if self.length == self.capacity

    self.length += 1
    self[length-1] = val

  end

  # O(1)
  def shift
    # Instead of shifting all element by one slot, we increment the start_idx:
    # r_b = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'] -> start_idx = 0
    # r_b.shift -> [nil, 'b', 'c', 'd', 'e', 'f', 'g', 'h'] and start_idx = 1

    raise "index out of bounds" if self.length == 0

    shifted_val = self[0]
    self[0] = nil
    self.length -= 1
    self.start_idx = (self.start_idx + 1) % self.capacity

    shifted_val
  end

  # O(1) ammortized
  def unshift(val)
    self.resize! if self.length == self.capacity

    self.start_idx = (self.start_idx - 1) % self.capacity
    self.length += 1
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" if index < 0 || index >= length
  end

  def resize!
    new_capacity = self.capacity * 2

    new_store = StaticArray.new(new_capacity)
    self.length.times { |idx| new_store[idx] = self[idx] }
    self.store = new_store

    self.capacity = new_capacity
    self.start_idx = 0

  end
end
