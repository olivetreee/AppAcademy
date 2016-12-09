require_relative 'heap2'

class PriorityMap
  def initialize(&prc)
    @map = {}

    prc ||= Proc.new{ |a, b| a <=> b }
    @queue = BinaryMinHeap.new { |k1, k2| prc.call(@map[k1], @map[k2]) }

  end

  def [](key)
    @map[key]
  end

  def []=(key, value)
    if @map.has_key?(key)
      self.update(key, value)
    else
      self.insert(key, value)
    end
  end

  def count
    @queue.count
  end

  def empty?
    self.count === 0
  end

  def extract
    key = @queue.extract
    value = @map.delete(key)
    [key, value]
  end

  def has_key?(key)
    @map.has_key?(key)
  end

  protected
  attr_accessor :map, :queue

  def insert(key, value)
    @map[key] = value
    @queue.push(key)
  end

  def update(key, value)
    @map[key] = value
    @queue.reduce!(key)
  end
end
