require_relative 'board'
require_relative 'ship'

class ComputerPlayer

  attr_reader :name, :board, :tracking_board

  def initialize(name)
    @name = name
    @board = Board.new
    @tracking_board = Board.new
    @positions_fired_at = []
  end

  def get_play
    get_random_position
  end

  def get_setup_choice
    "n"
  end

  def get_number_of_ships
    rand(max_num_of_ships) + 1
  end


  private

  def get_random_position
    a = false
    b = false
    until !a && b
      position = [rand(@board.board_size),rand(@board.board_size)]
      a = @positions_fired_at.include?(position)
      b = valid_position?(position)
    end
    @positions_fired_at << position
    position
  end

  def valid_position?(position)
    position.length == 2 && shot_inside_board(position)
  end

  def shot_inside_board(position)
    position.all? {|pos| (0...@board.board_size).cover?(pos)}
  end

  def max_num_of_ships
    ship_data = Ship.ship_types.values
    max_ship_size = ship_data.sort {|a,b| a.size <=> b.size}.last.size
    (@board.board_size ** 2) / max_ship_size
  end

end
