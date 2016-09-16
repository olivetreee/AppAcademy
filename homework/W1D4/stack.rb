class Stack

  def initialize
    @elements = []
  end


  def add(el)
    @elements << el
  end


  def remove
    @elements.pop
  end


  def show
    p @elements
  end

end

if __FILE__ == $PROGRAM_NAME
  stack = Stack.new
  stack.show
  puts "Adding 4"
  stack.add(4)
  stack.show
  puts "Adding 'Hello'"
  stack.add("Hello")
  puts "Adding 'World'"
  stack.add("World")
  puts "Adding '!'"
  stack.add("1")
  stack.show
  puts "Oops, removing..."
  stack.remove
  stack.show
  puts "Adding '!'"
  stack.add("!")
  stack.show
end
