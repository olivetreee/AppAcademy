require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)

    if @map.get(key).nil?
      # If there's no cached item, set it up
      val = @prc.call(key)
      @map.set(key, @store.insert(key, val) )

      # Eject the oldest item if there's a cache overflow
      eject! if count > @max

      val
    else
      # If there is a cached item, it should be brouht to the tail (recently accessed)
      wanted_link = @map.get(key)
      update_link!(wanted_link)

      wanted_link.val
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list

    # Remove link from previous position
    link.prev.next = link.next
    link.next.prev = link.prev

    # Place it at the end
    link.prev = @store.last
    link.next = @store.last.next #Same as @store.tail, but we don't have that as an attr_reader

    # Update previous last link to point to the new link as its .next
    @store.last.next = link
  end

  def eject!
    link_to_eject = @store.first

    # Removes from LinkedList
    link_to_eject.remove

    # Removes from HashMap
    @map.delete(link_to_eject.key)

    nil

  end
end
