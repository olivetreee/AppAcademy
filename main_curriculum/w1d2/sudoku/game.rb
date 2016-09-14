require 'byebug'
require_relative 'board'
require_relative 'player'

class Game

  attr_reader :board

  def initialize(filename)
    @board = Board.new(Board.from_file(filename))
    @player = Player.new
  end

  def play
    until over?
      @board.render
      position, value = @player.gets_play
      until valid_play?(position,value)
        puts "Invalid position and/or value."
        position, value = @player.gets_play
      end
      @board[*position].value = value
    end
    @board.render
    puts "Solved!!"
  end

  def valid_play?(position,value)
    return false unless position.all? {|pos| (0..8).cover?(pos)}

    # return false if @board[*position].given

    return true if value == 0

    return false if @board.in_row?(position,value) &&
      @board.in_col?(position,value) &&
      @board.in_square?(position,value)

    true
  end

  def over?
    @board.full?
  end

end

if __FILE__ == $PROGRAM_NAME
  sudoku = Game.new("puzzles/puzzle1.txt")
  sudoku.play
end
