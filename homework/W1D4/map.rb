class Map

  def initialize
    @pairs = []
  end


  def assign(key,value)
    if lookup(key).nil?
      @pairs << [key,value]
    else
      @pairs.each {|pair| pair[-1] = value if pair.first == key}
    end
  end


  def lookup(key)
    value = nil
    @pairs.each {|pair| value = pair.last if pair.first == key}
    value
  end


  def remove(key)
    @pairs.delete([key,lookup(key)])

  end


  def show
    puts "Map is empty." if @pairs.length == 0
    @pairs.each {|pair| puts "#{pair.first}: #{pair.last}"}
  end

end

if __FILE__ == $PROGRAM_NAME
  map = Map.new
  map.show
  puts "Adding my age"
  map.assign("Eric",29)
  map.show
  puts
  puts "Adding my wife's age"
  map.assign("Mariana",28)
  map.show
  puts
  puts "In Jan, I'll be one year older:"
  map.assign("Eric",30)
  map.show
  puts
  puts "Wife doesn't want her age here..."
  map.remove("Mariana")
  map.show
  puts
  puts "That's better."
end
