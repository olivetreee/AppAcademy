require_relative 'stack_and_queue_exercises'

def windowed_max_range(array, window_size)
  current_max_range = nil
  array.each_with_index do |val, index|
    window = array[index..index+window_size-1]
    window_range = window.max - window.min
    if current_max_range == nil || window_range > current_max_range
      current_max_range = window_range
    end
  end
  current_max_range
end

windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


def optimized_windowed_max_range(arr,window_size)
  max_range = nil
  stack_queue = StackQueue.new(window_size)
  # p stack_queue
  # until stack_queue.size == window_size
  #   stack_queue.enqueue(arr.shift)
  # end
  # p stack_queue
  #
  # curr_range = stack_queue.max - stack_queue.min

  arr.each do |el|
    stack_queue.enqueue(el)
    if stack_queue.size == window_size
      curr_range = stack_queue.max - stack_queue.min
      if max_range == nil || curr_range > max_range
        max_range = curr_range
      end
    end
    stack_queue.dequeue
  end
  p max_range
end

optimized_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
optimized_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
optimized_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
optimized_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
