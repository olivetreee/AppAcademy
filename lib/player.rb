require_relative 'hand'

class Player
  attr_accessor :pot
  attr_reader :hand, :deck, :name

  def initialize(deck,amount,name=nil)
    @deck = deck
    @pot = amount
    @name = name ? name : Player.random_names.sample
    get_new_hand
  end

  def get_new_hand
    @hand = Hand.new(@deck)
  end

  def action
    puts
    puts "#{@name}, you were dealt: #{@hand.cards.map(&:to_s).join(', ')}."
    puts "Your best hand is: #{@hand}."
    puts "You currently have $#{@pot}"
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
