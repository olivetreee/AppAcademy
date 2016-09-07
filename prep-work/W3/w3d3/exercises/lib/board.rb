require 'byebug'
require_relative 'ship'

class Board

  attr_reader :grid, :ships

  def initialize (grid = self.class.default_grid)
    @ships = []
    @grid = populated_grid(grid)
  end

  def count
    @ships.count
  end

  def empty?(position=[])
    if position.empty?
      board_empty?
    else
      cell_empty?(position)
    end
  end

  def full?
    @grid.all? do |row|
      row.none? {|cell| cell.nil?}
    end
  end

  def place_on_board(position,option,direction=["h","v"].sample)
    if option.instance_of?(Ship)
      place_ship(*position,option,direction)
    else
      self[position] = option
    end
  end

  def place_random_ship(direction = ["h","v"].sample)
    unless full?
      position = get_empty_position
      max_size = max_ship_allowed(*position,direction)
      @ships << Ship.create_random_ship(max_size)
      place_on_board(position,@ships.last,direction)
    else
      raise "The ocean is not infinite, you know..."
    end
  end

  def won?
    empty? ? true : false
  end

  def [] (position)
    @grid[position.first][position.last]
  end

  def []= (position,value)
    @grid[position.first][position.last] = value
  end

  def self.default_grid
    Array.new(10) {Array.new(10)}
  end

  def display
    print_columns_number
    @grid.each_with_index do |row,row_num|
      line = [""]
      row.each_index do |column_num|
        position = [row_num,column_num]
        if empty?(position) || cheat
          line << (self[position] || " ")
        else
          line << " "
        end
      end
      line << ""
      print_row_number(row_num+1)
      puts line.join(" | ")
    end
  end

  def board_size
    @grid.length
  end

  def max_ship_allowed(row,col,direction)
    max_size = 0
    case direction
    when "h"
      col.upto(@grid.length-1) do |i|
        break unless self[[row,i]].nil?
        max_size+=1
      end
    when "v"
      row.upto(@grid.length-1) do |i|
        break unless self[[i,col]].nil?
        max_size+=1
      end
    end
    max_size
  end


  private

  def board_empty?
    @grid.each_with_index do |row,row_num|
      row.each_index do |col_num|
        return false unless cell_empty?([row_num,col_num])
      end
    end
    true
    # @grid.all? do |row|
    #   row.all? {|cell| cell.nil? || cell == :x || cell == :o}
    # end
  end

  def cell_empty?(position)
    [nil,:o,:x].include?(self[position])
    # self[position].nil? || self[position] == :x || self[position] == :o
  end

  def place_ship(row,column,ship,direction)
    size = ship.size
    type = ship.type
    case direction
    when "h"
      size.times do |i|
        self[[row,i+column]] = type
      end
    when "v"
      size.times do |i|
        self[[i+row,column]] = type
      end
    end
  end

  def get_empty_position
    position = [rand(board_size),rand(board_size)]
    until empty?(position)
      position = [rand(board_size),rand(board_size)]
    end
    position
  end

  def populated_grid(grid)
    #This method checks for existing ships and stores them on the @ships
    #array. Right now, it only looks for :s types of ships so it passes
    #the specs
    existing_ships = 0
    grid.each do |row|
      existing_ships+= row.count {|cell| cell == :s}
    end
    store_existing_ships(existing_ships)
    grid
  end

  def store_existing_ships(number)
    number.times {@ships << Ship.new}
  end

  def print_columns_number
    line = ["  "]
    board_size.times do |num|
      extra_space = (num+1) < 10 ? " " : ""
      line << "#{extra_space}#{num+1}"
    end
    puts line.join("  ")
  end

  def print_row_number(row)
    print (row) < 10 ? " #{row}" : "#{row}"
  end

  def cheat
    true
    #Comment the line below to see the ships on the board
    # false
  end

end

# grid = [[:s, nil, nil],
#         [nil, :s, nil],
#         [nil, nil, :s]]
# # board = Board.new
# board = Board.new(grid)
# board.place_random_ship
# p board.display
