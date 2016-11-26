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
      val = @prc.call(key)
      @map.set(key, @store.insert(key, val) )
      val
    else
      @map.get(key)
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
  end

  def eject!
    link_to_eject = @store.first

    # Removes from LinkedList
    link_to_eject.remove

    # Removes from HashMap =>
    @map.delete(link_to_eject.key)

    nil

  end
end
