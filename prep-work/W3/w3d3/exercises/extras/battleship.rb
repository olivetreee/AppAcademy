require_relative 'board'
require_relative 'player'
require_relative 'computer'
require_relative 'ship'

class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board, player_2=nil, board_2=nil)
    @player_1 = player
    @board_1 = board
    @player_2 = player_2 || HumanPlayer.new("Player 2")
    @board_2 = board_2 || @player_2.board
    #The following will be the current players for each turn
    @player = @player_1
    @board = @board_1
    @other_player = @player_2
    @other_board = @board_2
  end

  def attack(position)
    if @other_board.empty?(position)
      @player.tracking_board.place_on_board(position,:o)
    else
      puts "We hit one of their ships, sir!"
      @player.tracking_board.place_on_board(position,:x)
      @other_board.place_on_board(position,:x)
    end
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def play_turn
    puts ""
    attack_position = @player.get_play
    attack(attack_position)
    switch_players!
  end

  def play
    2.times do
      setup_game(@player)
      switch_players!
    end

    until game_over?
      unless ComputerPlayer === @player
        puts "Here's our status, sir:"
        @board.display
        puts "Here's the tracking board, sir:"
        @player.tracking_board.display
      end
      play_turn
    end
    switch_players!
    @player.tracking_board.display
    puts "Captain #{@player.name} won!"
  end


  private

  def switch_players!
    @player = @player == @player_1 ? @player_2 : @player_1
    @board = @player.board

    @other_player = @other_player == @player_1 ? @player_2 : @player_1
    @other_board = @other_player.board
  end

  def setup_game(player)
    puts "Hello, Captain #{player.name}!"
    if player.get_setup_choice == "y"
      @player.manual_setup
      # ships_remaining = get_number_of_ships
      # until ships_remaining == 0
      #   player.manual_setup(ships_remaining)
      #   ships_remaining -= 1
      # end
    else
      puts "Ok, I'll position them for you, sir."
      automatic_setup
    end
    puts "Now switch players..."
  end

  def automatic_setup
    ships_number = @player.get_number_of_ships
    until @board.count == ships_number
      @board.place_random_ship
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  human = HumanPlayer.new("Jack Ryan")
  bot = HumanPlayer.new("Other Player")
  #Comment below to play against a human
  bot = ComputerPlayer.new("Marko Ramius")
  game = BattleshipGame.new(human,human.board,bot,bot.board)
  game.play
end
