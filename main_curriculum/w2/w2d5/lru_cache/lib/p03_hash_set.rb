require_relative 'p02_hashing'




class HashSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @size = num_buckets
  end

  def insert(key)
    resize! if @count == @size
    self[key.hash] = key
    @count+=1
  end

  def remove(key)
    self[key.hash].delete(key)
    @count-=1
  end

  def include?(key)
    self[key.hash].include?(key)
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
