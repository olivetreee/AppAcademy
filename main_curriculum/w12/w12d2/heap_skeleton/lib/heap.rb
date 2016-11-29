require 'byebug'

class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
  end

  def count
  end

  def extract
    @store[0], @store[-1] = @store[-1], @store[0]
    extracted = @store.pop
    self.class.heapify_down(@store, 0, @store.length)
    extracted
  end

  def peek
    self[0]
  end

  def push(val)
    @store << val
    len = @store.length
    child_idx = len-1
    self.class.heapify_up(@store, child_idx, len)
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    child_idx_1 = parent_index*2 + 1
    child_idx_2 = parent_index*2 + 2

    if child_idx_1 >= len
      return nil
    elsif child_idx_2 >= len
      return [child_idx_1]
    else
      return [child_idx_1, child_idx_2]
    end

  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index -1)/2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc = prc || Proc.new { |el1, el2| el1 <=> el2 }

    children_idx = self.child_indices(len, parent_idx)
    return array unless children_idx # No children, so parent is a leaf

    children = children_idx.map{|idx| array[idx]}
    parent = array[parent_idx]

    # If all children are already smaller than parent, return the array
    # byebug
    return array if children.all? {|chd| prc.call(parent, chd) < 0}

    if children.length == 1
      idx_to_swap = children_idx.first
    else # Decides which child is smallest
      if prc.call(children[0], children[1]) < 0
        idx_to_swap = children_idx[0]
      else
        idx_to_swap = children_idx[1]
      end
    end

    array[idx_to_swap], array[parent_idx] = array[parent_idx], array[idx_to_swap]

    heapify_down(array, idx_to_swap, len, &prc)

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc = prc || Proc.new { |el1, el2| el1 <=> el2 }

    while child_idx > 0
      parent_idx = self.parent_index(child_idx)
      parent = array[parent_idx]
      child = array[child_idx]

      if prc.call(child, parent) < 0
        array[child_idx], array[parent_idx] = array[parent_idx], array[child_idx]
        child_idx = parent_idx
      else
        return array
      end

    end

    return array
  end

end
