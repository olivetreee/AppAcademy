require 'byebug'

class ComputerPlayer

attr_reader :seen

  def initialize(name,board)
    @seen = Hash.new{|h,k| h[k]=[]}
    @board = board
  end

  def register_guess(guess)
    card = @board[*guess]
    @seen[card.value] << guess unless @seen[card.value].include?(guess)
  end

  def seen_value?(guess)
    card = @board[*guess]
    @seen.keys.include?(card.value) && @seen[card.value].first != guess
  end

  def get_guess(previous_guess=nil)
    guess=nil
    if @seen.values.any?{|value| value.length == 2}
      # byebug
      @seen.each do |value,positions|
        guess = positions.shift if positions.length == 2
      end
    elsif previous_guess.nil?
      guess = random_guess
    else
      if seen_value?(previous_guess)
        card = @board[*previous_guess]
        guess = @seen[card.value].first
      else
        guess = random_guess
      end
    end
    guess
  end

  def random_guess
    valid_numbers = (0...@board.grid_size).to_a
    [valid_numbers.sample,valid_numbers.sample]
  end
end
