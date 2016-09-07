class HumanPlayer

  attr_reader :name
  attr_accessor :mark, :board

  def initialize(name)
    @name = name
  end

  def display(board)
    puts "Current state:"
    board.grid.each {|row| p row}
  end

  def get_move
    puts "Where would you want to place your mark?"
    position = gets.chomp
    row = position[0].to_i
    column = position[2].to_i
    [row,column]
  end

end
