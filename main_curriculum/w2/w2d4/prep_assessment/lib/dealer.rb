require_relative 'player'

class Dealer < Player
  attr_reader :bets

  def initialize
    super("dealer", 0)

    @bets = {}
  end

  def place_bet(dealer, amt)
    raise "Dealer doesn't bet"
  end

  def play_hand(deck)
    hand.hit(deck) while self.hand.points < 17
  end

  def take_bet(player, amt)
    @bets[player] = amt
  end

  def pay_bets
    players = @bets.keys
    total_bets = @bets.values.reduce(:+)
    players.each do |player|
      player.pay_winnings(total_bets*2) if player.hand.beats?(self.hand)
    end
  end
end







# def pay_bets
#   byebug
#   players = @bets.keys
#   total_bets = @bets.values.reduce(:+)
#   players.each do |player|
#     player.pay_winnings(total_bets) if player.hand.beats?(self.hand)
#   end
# end
