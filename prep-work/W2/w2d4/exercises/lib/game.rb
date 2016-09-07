require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_reader :board, :current_player

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @player_1.mark = :X
    @player_2.mark = :O
    @board = Board.new
    @current_player = @player_1
  end

  def play
    until @board.over?
      play_turn
    end
    puts ""
    switch_players!
    if @board.winner
      puts "And the winner is #{@current_player.name}!"
    else
      puts "It's a tie!"
    end
    @current_player.display(@board)
  end

  def play_turn
    puts ""
    @current_player.display(@board)
    # @player_2.display(@board)
    player_move = @current_player.get_move
    @board.place_mark(player_move,@current_player.mark)
    # byebug
    switch_players!
  end

  def switch_players!
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end
end

if __FILE__ == $PROGRAM_NAME
  # PLAY A GAME AGAINST C3PO BY UNCOMENTING THE CODE BELOW
  p1 = HumanPlayer.new("R2D2")
  p2 = ComputerPlayer.new("C3PO")
  # p2 = HumanPlayer.new("R2D2")
  # p1 = ComputerPlayer.new("C3PO")
  new_game = Game.new(p1,p2)
  new_game.play
end
