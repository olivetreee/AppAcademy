require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return if array.length == 1

    pivot = array[0]
    left_side = array.select{|num| num <= pivot}
    right_side = array.select{|num| num > pivot}

    self.sort1(left_side) + [pivot] + self.sort1(right_side)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new{ |a,b| a<=>b }

    return array if length <= 1

    pivot_idx = self.partition(array, start, length, &prc)

    # left_side
    left_start = start
    left_length = pivot_idx - left_start # left_side should go from 0 (or whatever start) to the pivot_idx. If start is not 0, we have to compensate on the left_length, so pivot_idx - left_start
    self.sort2!(array, left_start, left_length, &prc)

    # right_side
    right_start = pivot_idx + 1
    # right_length = length - pivot_idx
    right_length = length - (left_length+1) # right_side starts right after pivot_idx and ends at end of array. So if we have [1,2,3,4,5] w/ pivot_idx = 2, our right side runs through through 2 elements (idx 3 and 4). So our length is 2. So we need length - left_length. We add one to left_length to account for pivot_el
    self.sort2!(array, right_start, right_length, &prc)

  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new{ |a,b| a<=>b }
    pivot_idx = start
    pivot_el = array[pivot_idx]

    for idx in (start+1...start+length)
      el = array[idx]

      if prc.call(el, pivot_el) > 0
      # if greater, leave where it is
      elsif
        # if smaller:

        # 1) Swap the element with the value that's @ pivot_idx's next, which can be:
        # • a value that's greater than pivot: [6(pivot_idx), 7, 3(idx), 4, 2] => swapping 7 and 3
        # • the same as el, since idx = pivot_idx+1: [6(pivot_idx), 3(idx), 4, 7, 2] => swapping 3 with itself
        array[idx] = array[pivot_idx+1]
        array[pivot_idx+1] = el

        # 2) At this point: [6(pivot_idx), 3, 7(idx), 4, 2]
        # Walk the pivot element to its new position, which is right next to the pivot_idx.
        # So swap the pivot with pivot_idx+1
        array[pivot_idx] = array[pivot_idx+1]
        array[pivot_idx+1] = pivot_el


        # 3) Now we have [3(pivot_idx), 6, 7(idx), 4, 2]
        # Increment pivot_idx
        pivot_idx += 1

      end


    end

    return pivot_idx

  end
end
