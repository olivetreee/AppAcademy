class HumanPlayer
  def initialize(name,board)
    @name = name
  end

  def get_guess(previous_guess=nil)
    puts "Guess 2 cards"
    gets.chomp.split(",").map(&:to_i)
  end
end
