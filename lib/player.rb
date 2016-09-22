require_relative 'hand'

class Player
  attr_reader :hand, :deck, :pot, :name

  def initialize(deck,amount,name=nil)
    @deck = deck
    @pot = amount
    @hand = Hand.new(@deck)
    @name = name ? name : Player.random_names.sample
  end

  def action
    puts "You were dealt: #{@hand.cards.map(&:to_s).join(', ')}."
    puts "Your best hand is: #{@hand}."
  end

  def self.random_names
    [
      "Johnny",
      "Sam",
      "Brian",
      "Jeff",
      "Joe",
      "George",
      "Juliet"
    ]
  end

  def to_s
    "#{@name} ($#{@pot})"
  end

  private
  def prompt(msg)
    puts msg
    gets.chomp
  end
end
