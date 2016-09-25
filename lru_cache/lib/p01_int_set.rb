class MaxIntSet
  def initialize(max)
    @max = max
    @array = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @array[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num > @max || num < 0
    @array[num] = false
  end

  def include?(num)
    raise "Out of bounds" if num > @max || num < 0
    @array[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @size = num_buckets
  end

  def insert(num)
    self[num] = num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @size]
  end

  def []=(num, value)
    @store[num % @size] << value
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @size = num_buckets
  end

  def insert(num)
    resize! if @count == @size
    self[num] = num
    @count+=1
  end

  def remove(num)
    self[num].delete(num)
    @count-=1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @size]
  end

  def []=(num, value)
    @store[num % @size] << value
  end

  def num_buckets
    @store.length
  end

  def resize!
    waiting_list = @store.flatten
    @size = @size*2
    @count = 0 
    @store = Array.new(@size) { Array.new }
    waiting_list.each do | ele |
      self.insert(ele)
    end
  end
end
