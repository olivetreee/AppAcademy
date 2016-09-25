require 'byebug'

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
    current_link = @head
    until current_link == @tail
      if current_link.key == key
        return current_link.val
      else
        current_link = current_link.next
      end
    end
    nil
  end

  def include?(key)
    !get(key).nil?
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    self.last.next = new_link
    new_link.next = @tail

    new_link.prev = self.last
    @tail.prev = new_link
  end

  def remove(key)
    link = get_link_from_key(key)
    unless link.nil?
      link.prev.next = link.next
      link.next.prev = link.prev
    end
  end

  def each
    current_link = self.first
    until current_link == @tail
      yield current_link
      current_link = current_link.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end

  def get_link_from_key(key)
    current_link = @head
    until current_link == @tail 
      if current_link.key == key
        return current_link
      else
        current_link = current_link.next
      end
    end
    nil
  end

end
