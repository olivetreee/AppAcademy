class ComputerPlayer

  attr_reader :name
  attr_accessor :mark, :board

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    next_move = nil
    empty_tiles = get_empty_tiles
    #Check on each row and col and if count of marks is 2. If so, there's a winning move to be made
    empty_tiles.each do |position|
      if winner_on_row?(position[0])
        next_move = position
        break
      elsif winner_on_column?(position[1])
        next_move = position
        break
      elsif winner_on_diag?(*position)
        next_move = position
        break
      end
    end

    number_empty_tiles = get_empty_tiles.count
    random_position = rand(number_empty_tiles)
    next_move ||= empty_tiles[random_position]
  end


  private

  def get_empty_tiles
    empty_tiles = []
    for row in 0..2
      for col in 0..2
        empty_tiles << [row,col] if @board[row,col].nil?
      end
    end
    empty_tiles
  end

  def winner_on_row?(row)
    marks_count = @board.grid[row].count {|tile| tile == @mark}
    return true if marks_count == 2

    #Uncomment the below to consider blocking the other player if he's about to win
    #The issue here is that it won't prioritize winning, so it might make a move
    #to stop the other player even if it has the chance of winning.
    #Therefore, might not pass the specs
    # marks_count = @board.grid[row].count
    # uniq_marks = @board.grid[row].uniq.count
    # return true if marks_count == 2 && uniq_marks == 1

    return true if marks_count == 2
    false
  end


  def winner_on_column?(col)
    streak = [@board[0,col], @board[1,col], @board[2,col]]
    marks_count = streak.count {|tile| tile == @mark}

    #Uncomment the below to consider blocking the other player if he's about to win
    #The issue here is that it won't prioritize winning, so it might make a move
    #to stop the other player even if it has the chance of winning.
    #Therefore, might not pass the specs
    # marks_count = streak.count
    # uniq_marks = streak.uniq.count
    # return true if marks_count == 2 && uniq_marks == 1

    return true if marks_count == 2
    false
  end

  def winner_on_diag?(row,col)
    #Specs don't cover this option.

    main_diagonal = [[0,0],[1,1],[2,2]]
    anti_diagonal = [[0,2],[1,1],[2,0]]
    streak = []

    if main_diagonal.include?([row,col])
      streak = [@board[0,0], @board[1,1], @board[2,2]]
    elsif anti_diagonal.include?([row,col])
      streak = [@board[0,2], @board[1,1], @board[2,0]]
    end
    marks_count = streak.count {|tile| tile == @mark}

    #Uncomment the below to consider blocking the other player if he's about to win
    #The issue here is that it won't prioritize winning, so it might make a move
    #to stop the other player even if it has the chance of winning.
    #Therefore, might not pass the specs. Might fix this in the feature, if time allows
    # marks_count = streak.count
    # uniq_marks = streak.uniq.count
    # return true if marks_count == 2 && uniq_marks == 1

    return true if marks_count == 2
    false
  end

end
