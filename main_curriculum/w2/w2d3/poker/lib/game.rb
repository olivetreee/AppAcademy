require_relative 'player'
require_relative 'deck'

class Game
  def initialize(player_details)
    @deck = Deck.instance
    @players = []
    @pot = 0
    setup_players(player_details)
  end

  def play
    puts "The players are:"
    @players.each {|player| puts "#{player}"}
    round = 0
    until game_over?
      round += 1
      puts
      puts
      puts "========= Round #{round} ==================="
      @deck.populate_cards
      deal

      @players.select{|player| player.pot > 0}.each do |player|
        player.action

        if player.pot >= 10
          bet = 10
        else
          bet = player.pot
        end

        player.pot -= bet
        @pot += bet
      end

      winner = @players.sort do |a, b|
        b.hand <=> a.hand
      end.first

      winner.pot += @pot
      @pot = 0

      # gets
    end
  end

  private

  def deal
    @players.each {|player| player.get_new_hand}
  end

  def game_over?
    @players.count {|player| player.pot <= 0} >= @players.length - 1
  end

  def setup_players(player_details)
    player_details.each {|details| setup_new_player(details)}
  end

  def setup_new_player(details)
    default_options = {
      name: random_unique_name,
      pot: 100
    }

    options = default_options.merge(details)

    @players << Player.new(@deck, options[:pot], options[:name])
  end

  def random_unique_name
    names = Player.random_names.reject do |name|
      @players.any?{|player| player.name == name}
    end

    return Player.random_names.sample if names.length < 1

    names.sample
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new(Array.new(10){Hash.new})
  game.play
end
