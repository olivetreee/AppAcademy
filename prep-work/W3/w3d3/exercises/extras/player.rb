require_relative 'board'
require_relative 'ship'

class HumanPlayer

  attr_reader :name, :board, :tracking_board, :age

  def initialize(name)
    @name = name
    @board = Board.new
    @tracking_board = Board.new
  end

  def get_play
    puts "Awaiting your lat and lon orders, sir:"
    position = position_to_index(gets.chomp)
    until valid_position?(position)
      puts "That's not a valid position, sir. Please state lan,lon"
      position = position_to_index(gets.chomp)
    end
    position
  end

  def get_setup_choice
    setup_choice = ""
    until ["y","n"].include?(setup_choice)
      puts "Do you want to position the fleet, sir? (y/n)"
      setup_choice = gets.chomp
    end
    setup_choice
  end

  def manual_setup
    ships_remaining = get_number_of_ships
    until ships_remaining == 0
      puts "Here's the territory, sir."
      puts "We have #{ships_remaining} ships left, sir."
      @board.display
      puts ""
      print_possibilities
      choices = [nil]
      until all_choices_valid?(choices)
        puts "Please select type code,lat,lon,direction:"
        choices = gets.chomp
        choices = choices.split(",")
      end
      place_ships(choices)
      ships_remaining -= 1
    end
  end

  def get_number_of_ships
    max_num_of_ships
    puts "How many ships would you like to place, sir?"
    num_of_ships = gets.chomp.to_i
    until num_of_ships <= max_num_of_ships
      puts "Sorry, sir, we only have #{max_num_of_ships} ships available."
      num_of_ships = gets.chomp.to_i
    end
    num_of_ships
  end

  private

  def print_possibilities
    puts "Types (code,name,size):"
    Ship.print_types
    puts ""

    puts "Direction:"
    puts "h for Horizontal"
    puts "v for Vertical"
    puts ""
  end

  def all_choices_valid?(choices)
    # byebug
    return false if choices.include?(nil) || choices.length != 4
    type,row,col,direction = choices
    position = position_to_index([row,col].join(","))
    ship_type = type.to_sym
    ship_size = Ship.ship_types[ship_type].size
    a = Ship.valid_type?(ship_type)
    b = valid_position?(position)
    c = valid_direction?(direction)
    d = ship_size <= @board.max_ship_allowed(*position,direction)
    a && b && c && d
  end

  def valid_position?(position)
    position.length == 2 && shot_inside_board(position)
  end

  def valid_direction?(direction)
    ["h","v"].include?(direction)
  end

  def place_ships(choices)
    type,row,col,direction = choices
    position = [(row.to_i)-1,(col.to_i)-1]
    ship = Ship.new(type.to_sym)
    @board.place_on_board(position,ship,direction)
  end

  def position_to_index(position)
    position = position.split(",").map(&:to_i)
    position.map {|pos| pos-1}
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
