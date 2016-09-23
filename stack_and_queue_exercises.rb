require 'byebug'
class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  def initialize
    @store = []
    @min = []
    @max = []
  end

  def pop
    @max.pop
    @min.pop
    @store.pop
  end

  def push(el)
    @store << el
    #max
    if @max.empty?
      @max << el
    elsif el > @max.last
      @max << el
    elsif el <= @max.last
      @max << @max.last
    end

    #min
    if @min.empty? || el < @min.last
      @min << el
    elsif el >= @min.last
      @min << @min.last
    end

    def max
      @max.last
    end

    def min
      @min.last
    end

  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end


end

class StackQueue
  attr_reader :queue

  def initialize(window_size)
    @queue = [ MyStack.new, MyStack.new ]
    @window_size = window_size
  end

  def enqueue(el)
    @queue[1].push(el)

    if @queue[1].size == @window_size
      pop_push_stacks until @queue[1].empty?
    end

  end

  def dequeue
    @queue[0].pop
  end

  def pop_push_stacks
    @queue[0].push(@queue[1].pop)
  end

  def size
    @queue[0].size + @queue[1].size
  end

  def empty?
    @queue[0].empty? && @queue[1].empty?
  end

  def max
    return @queue[0].max if @queue[1].empty?
    return @queue[1].max if @queue[0].empty?
    case @queue[0].max <=> @queue[1].max
    when 1
      @queue[0].max
    else
      @queue[1].max
    end
  end
  def min
    return @queue[0].min if @queue[1].empty?
    return @queue[1].min if @queue[0].empty?
    case @queue[0].min <=> @queue[1].min
    when -1
      return @queue[0].min
    else
      return @queue[1].min
    end
  end

end
