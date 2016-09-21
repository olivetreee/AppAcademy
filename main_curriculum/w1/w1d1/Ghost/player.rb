class Player

  attr_reader :name, :losses

  def initialize(name="Gizmo")
    @name = name
    @losses = 0
  end

  def guess
    print "#{name}, enter a letter to guess: "
    gets.chomp.downcase
  end

  def alert_invalid_guess
    puts "Invalid guess."
    guess
  end

  def increment_losses
    @losses += 1
  end
end
