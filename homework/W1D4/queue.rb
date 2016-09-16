class Queue

  def initialize
    @elements = []
  end


  def enqueue(el)
    @elements.unshift(el)
  end


  def dequeue
    @elements.pop
  end


  def show
    p @elements
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Writing my name:"
  puts "END ---------------- START"
  queueu = Queue.new
  queueu.show
  queueu.enqueue("C")
  queueu.show
  queueu.enqueue("I")
  queueu.show
  queueu.enqueue("R")
  queueu.show
  queueu.enqueue("E")
  queueu.show
  puts
  puts "Deleting my name:"
  queueu.dequeue
  queueu.show
  queueu.dequeue
  queueu.show
  queueu.dequeue
  queueu.show
  queueu.dequeue
  queueu.show
end
