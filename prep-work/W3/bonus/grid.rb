class MazeGrid

  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def [](row,col)
    @grid[row][col]
  end

  def []=(row,col,value)
    @grid[row][col] = value
  end

  def erase_grid
    @grid = @grid.map do |row|
      row.map {|node| node = nil}
    end

  end

end
