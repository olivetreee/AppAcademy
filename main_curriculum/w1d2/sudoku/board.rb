require_relative 'tile'

class Board
  attr_reader :grid
  def initialize(grid)
    @grid = grid
    # @row_hash =
  end

  def full?
    @grid.all? do |row|
      row.all? {|tile| tile.value != 0}
    end
  end

  def render
    row_count = 1
    @grid.each do |row|
      row_string = ""
      col_count = 1
      row.each do |tile|
        separator = (col_count%3==0 && col_count<9) ? " | " : " "
        row_string << "#{tile.value}#{separator}"
        col_count+=1
      end
      puts row_string
      # puts "-" * row_string.length
      puts "-" * row_string.length if (row_count%3==0 && row_count<9)
      row_count+=1
    end
  end

  def [](x,y)
    @grid[x][y]
  end

  def self.from_file(filename)
    lines = File.readlines(filename)
    grid = lines.map do |line|
      line.chomp.split("").map(&:to_i)
    end
    grid.map do |row|
      row.map do |num|
        Tile.new(num)
      end
    end
  end


  def in_row?(pos,val)
    row,col = pos
    @grid[row].any? {|tile| tile.value == val}
  end

  def in_col?(pos,val)
    row,col = pos
    extract_column(col).any? {|tile| tile.value == val}
  end

  def in_square?(pos,val)
    row,col = pos
    square_row = (row / 3) * 3
    square_col = (col / 3) * 3
    extract_square(square_row,square_col).any? {|tile| tile.value == val}
  end

  private

  def extract_column(col)
    @grid.map {|row| row[col]}
  end

  def extract_square(square_row,square_col)
    result = []
    3.times do |row|
      3.times do |col|
        result << self[square_row + row, square_col + col]
      end
    end
    result
  end

end
