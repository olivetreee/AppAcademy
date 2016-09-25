
require 'byebug'
class Hand
  # This is called a *factory method*; it's a *class method* that
  # takes the a `Deck` and creates and returns a `Hand`
  # object. This is in contrast to the `#initialize` method that
  # expects an `Array` of cards to hold.
  def self.deal_from(deck)
    cards = deck.take(2)
    Hand.new(cards)
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    partial_sum = 0
    @cards.each do |card|
      # if there's one ace, check the partial sum
      # if there are more than 1 aces, they're worth one
      partial_sum += card.value == :ace ? 0 : card.blackjack_value
    end

    partial_sum + sum_aces_values(partial_sum)

  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if busted?
    @cards += deck.take(1)
  end

  def beats?(other_hand)
    return false if self.busted? || other_hand.points == self.points
    return true if other_hand.points < self.points || other_hand.busted?
    false
  end

  def return_cards(deck)
    deck.return(@cards)
    @cards = []
  end

  def to_s
  end

  private

  def sum_aces_values(partial_sum)
    return 0 unless has_aces?
    num_of_aces = count_aces
    if num_of_aces == 1
      return partial_sum > 10 ? 1 : 11
    else
      return 1 * num_of_aces
    end
  end

  def has_aces?
    @cards.any?{|card| card.value == :ace}
  end

  def count_aces
    @cards.count {|card| card.value == :ace}
  end

end
