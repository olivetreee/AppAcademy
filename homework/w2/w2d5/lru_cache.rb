class LRUCache
  def initialize(max_size)
    @max_size = max_size
    @current_size = 0
    @cache = []
  end

  def count
    @current_size
    # returns number of elements currently in cache
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif @current_size >= @max_size
      @cache.shift
      @cache << el
    else
      @cache << el
      @current_size += 1
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
  end

  private

    # helper methods go here!
end

class LinkedList
  def initialize(value,next_node,prev_node)
    @value = value
    @next = next_node
    @prev = prev_node
  end

  def delete(node)
    prev_node = node.prev
    next_node = node.next
    prev_node.next = next_node
    next_node.prev = prev_node
  end
  
  def insert(new_node, tail_node)
    new_tail = tail_node.prev
    new_tail.next = nil
  end

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show
