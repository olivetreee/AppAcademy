class Player

  def gets_play
    puts
    puts "Enter position, number:"
    play = gets.chomp
    play = play.split(",").map(&:to_i)
    value = play.pop
    position = play.map {|pos| pos-1}
    [position,value]
  end

end
