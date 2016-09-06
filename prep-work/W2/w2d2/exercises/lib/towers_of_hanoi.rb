# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp.html) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi

attr_reader :towers

  def initialize(num_of_pieces = 3)
    @num_of_pieces = num_of_pieces
    @towers = initialize_towers(@num_of_pieces)
    @number_of_moves = 0
  end

  def play
    until won?
      puts "Current state:"
      render

      puts "Select a tower to move from:"
      tower_from = gets.chomp.to_i - 1

      puts "Where are you moving the piece to?"
      tower_to = gets.chomp.to_i - 1

      unless valid_move?(tower_from,tower_to)
        puts "! INVALID MOVE !"
        puts ""
        next
      end
      move(tower_from, tower_to)
      @number_of_moves+=1
    end
    end_game
  end

  def render
    num_of_towers = @towers.length
    num_of_towers.times {|tower| print_tower(@towers[tower],tower)}
  end

  def won?
    @towers[0].empty? && @towers[1..2].any?(&:empty?)
  end

  def valid_move?(from_num, to_num)

    from = @towers[from_num]
    to = @towers[to_num]

    #Can't pick from / move to non-existing tower
    return false if from_num+1 > @towers.count || to_num+1 > @towers.count

    #Can't pick from empty tower
    return false if from.empty?

    #No disk may be placed on top of a smaller disk.
    return false if !(to.empty?) && from.last > to.last

    true

  end

  def move(from_idx, to_idx)
    @towers[to_idx] << @towers[from_idx].pop
  end

  def initialize_towers(num_of_towers)
    towers = [[]]
    num_of_towers.downto(1) { |tower| towers[0] << tower }
    2.times {towers << []}
    towers
  end

  def end_game
    render
    puts "FINISHED!!"
    min_moves = 2**@num_of_pieces - 1
    exceeding_moves = @number_of_moves - min_moves
    puts "It took you #{@number_of_moves} moves to complete."
    puts "That's #{exceeding_moves} moves above the minimum for #{@num_of_pieces} pieces: #{min_moves}."
  end

  private

  def print_tower(discs,tower)
    str = "Tower #{tower+1}: "
    (discs.count-1).downto(1) do |disc|
      str += "#{discs[disc]} on top of "
    end
    str += discs.first == 0 ? "empty" : "#{discs.first}"
    puts str
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "How many pieces?"
  num_of_towers = gets.chomp.to_i
  game = TowersOfHanoi.new(num_of_towers)
  game.play
end
