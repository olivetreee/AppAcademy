class Board

  attr_reader :grid, :winner, :MAIN_DIAGONAL, :ANTI_DIAGONAL

  def initialize(grid = Array.new(3) {Array.new(3)})
    @grid = grid
    @winner = nil
  end

  def [](x,y)
    @grid[x][y]
  end

  def []=(x,y,val)
    @grid[x][y] = val
  end

  def place_mark(position,mark)
    until self[*position].nil?
      puts "This spot already has #{self[*position]}. Try again."
      position = get_move
    end
    self[*position] = mark

    check_tiles = extract_affected_tiles(*position)
    check_tiles.each do |tiles|
      if three_marks_streak?(tiles)
        @winner = tiles[0]
        break
      end
    end
  end

  def empty?(position) #DONE
    self[*position].nil?
  end

  def over?
    return true if board_full? || winner
    false
  end



  private

  def board_full?
    @grid.all? do |sub_grid|
      sub_grid.none? {|position| position.nil?}
    end
  end

  def extract_affected_tiles(row,column)
    main_diagonal = [[0,0],[1,1],[2,2]]
    anti_diagonal = [[0,2],[1,1],[2,0]]
    tiles = []
    tiles << extract_row(row)
    tiles << extract_column(column)
    tiles << extract_main_diagonal if main_diagonal.include?([row,column])
    tiles << extract_anti_diagonal if anti_diagonal.include?([row,column])
    tiles
  end

  def extract_row(row)
    @grid[row]
  end

  def extract_column(column)
    [@grid[0][column], @grid[1][column], @grid[2][column]]
  end

  def extract_main_diagonal
    [@grid[0][0], @grid[1][1], @grid[2][2]]
  end

  def extract_anti_diagonal
    [@grid[0][2], @grid[1][1], @grid[2][0]]
  end

  def three_marks_streak?(tiles)
    tiles.all? {|mark| mark == tiles[0]}
  end

  def get_move
    puts "Where would you want to place your mark?"
    position = gets.chomp
    row = position[0].to_i
    column = position[2].to_i
    [row,column]
  end


end
