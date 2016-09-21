require_relative 'board'
require_relative 'card'
require_relative 'HumanPlayer'
require_relative 'ComputerPlayer'

class Game
  def initialize(number_of_cards)
    @number_of_cards = number_of_cards
    @board=Board.new(number_of_cards)
    @previous_guess = nil
    @player = ComputerPlayer.new("amanda",@board)
  end

  def play
    until over?
      @board.render
      guess1 = @player.get_guess
      until valid_move?(guess1)
        puts "Invalid move! Try again."
        guess1 = @player.get_guess
      end
      @player.register_guess(guess1)
      @board[*guess1].reveal
      @previous_guess = guess1
      @board.render
      p @player.seen
      # gets.chomp
      puts
      guess2 = @player.get_guess(@previous_guess)
      until valid_move?(guess2)
        puts "Invalid move! Try again."
        guess2 = @player.get_guess(@previous_guess)
      end
      @player.register_guess(guess2)
      @board[*guess2].reveal
      @board.render
      if match?(guess2)
        puts "You got a match!!"
      else
        @board[*guess2].hide
        @board[*@previous_guess].hide
      end
      @previous_guess = nil
      p @player.seen
      # gets.chomp
      system("clear")
    end
    puts "YOU WON!"
  end

  def match?(guess)
    @board[*guess].value == @board[*@previous_guess].value
  end

  def over?
    @board.grid.all? do |row|
      row.all? {|card| card.shown}
    end
  end

  def valid_move?(guess)
    valid_numbers = (0...@board.grid_size).to_a
    return false if guess.any? {|el| !valid_numbers.include?(el)}
    unless @previous_guess.nil?
      return false if guess == @previous_guess
    end
    return false if @board[*guess].shown
    true
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new(16).play
end
