require_relative 'player'
require_relative 'deck'

class Game
  def initialize(player_details)
    @deck = Deck.instance
    @players = []
    setup_players(player_details)
  end

  def play
    puts "The players are:"
    @players.each {|player| puts "#{player}"}

    until game_over?
      @players.sort! do |a, b|
        b.hand <=> a.hand
      end

      @players.each {|player| player.action}
      gets
    end
  end

  private

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
