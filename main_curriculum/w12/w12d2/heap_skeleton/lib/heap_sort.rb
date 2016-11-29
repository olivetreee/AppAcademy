require_relative "heap"

class Array
  def heap_sort!

    # Build the heap in place. Barries is set by index i
    for i in (1...self.length)
      BinaryMinHeap.heapify_up(self, i, i+1)
    end

    # Goes right to left swapping and then maintaining the heap
    self.length.downto(2) do |idx|
      # byebug
      self[0], self[idx-1] = self[idx-1], self[0]
      heap_length = idx - 1
      BinaryMinHeap.heapify_down(self, 0, heap_length)
    end

    # Since we're doing MinHeap, it ends up being a reversed-sorted array.
    self.reverse!

  end
end
