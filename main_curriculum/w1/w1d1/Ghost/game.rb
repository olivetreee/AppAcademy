require 'set'
require_relative 'player'

class Game


  def initialize(dictionary, *players)
    @players = players
    @current_player = @players[0]
    @previous_player = @players[1]
    @dictionary = prepare_dictionary(dictionary)
    @fragment = ""
    @losers = []
  end

  def prepare_dictionary(dictionary)
    words = File.readlines(dictionary).map(&:chomp)
    Set.new(words)
  end

  def play
    until game_over?
      play_round
      kick_player if @previous_player.losses == 5
      display_standings
    end
    puts "#{@players[0].name} is the big winner!!"
  end

  def play_round
    @fragment = ""
    until round_over?
      take_turn
      puts @fragment
      next_player
    end
    puts "#{@previous_player.name} lost!"
    @previous_player.increment_losses
  end

  def next_player
    @previous_player = @current_player
    @players.rotate!
    @current_player = @players[0]
  end

  def take_turn
    guess = @current_player.guess
    until valid_play?(guess)
      guess = @current_player.alert_invalid_guess
    end
    @fragment+=guess
  end

  def display_standings
    @players.each do |player|
      puts "#{player.name}: " + "GHOST"[0...player.losses]
    end
    @losers.each do |loser|
      puts "#{loser.name}: " + "GHOST"
    end
  end

  def valid_play?(guess)
    return false unless ("a".."z").to_a.include?(guess)
    @dictionary.any? {|word| word.start_with?(@fragment+guess)}
  end

  def round_over?
    @dictionary.include? @fragment
  end

  def game_over?
    @players.size == 1
  end

  def kick_player
    @losers << @previous_player
    @players.delete(@previous_player)
  end
end

if __FILE__ == $PROGRAM_NAME
  player_1 = Player.new("Ish")
  player_2 = Player.new("Eric")
  player_3 = Player.new()
  game = Game.new("dictionary.txt", player_1, player_2, player_3)
  game.play
end
