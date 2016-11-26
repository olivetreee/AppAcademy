require_relative 'p02_hashing'
require_relative 'p04_linked_list'

# class HashMap
#   attr_reader :count
#
#   def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { LinkedList.new }
#     @count = 0
#     @size = num_buckets
#   end
#
#   def insert(key)
#     resize! if @count == @size
#     self[key.hash] = key
#     @count+=1
#   end
#
#   def remove(key)
#     self[key.hash].delete(key)
#     @count-=1
#   end
#
#   def include?(key)
#     self[key.hash].include?(key)
#   end
#
#   # private
#
#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#     @store[num % @size]
#   end
#
#   def []=(num, value)
#     @store[num % @size] << value
#   end
#
#   def num_buckets
#     @store.length
#   end
#
#   def resize!
#     waiting_list = @store.flatten
#     @size = @size*2
#     @count = 0
#     @store = Array.new(@size) { Array.new }
#     waiting_list.each do | ele |
#       self.insert(ele)
#     end
#   end
# end



class HashMap

  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
    @size = num_buckets
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! if @count == @size
    linked_list = bucket(key)
    target_link = linked_list.get_link_from_key(key)
    if target_link.nil?
      linked_list.insert(key,val)
    else
      target_link.val = val
    end
    @count += 1
    val
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each
    @store.each do |linked_list|
      linked_list.each do |link|
        yield [link.key, link.val]
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    waiting_list = []
    @store.each do |linked_list|
      linked_list.each do |link|
        waiting_list << [link.key, link.val]
      end
    end

    @size *= 2
    @store = Array.new(@size) { LinkedList.new }
    @count = 0

    waiting_list.each do |pair|
      self.set(pair[0], pair[1])
    end

  end


  def bucket(key)
    @store[key.hash % @size]
  end
end
