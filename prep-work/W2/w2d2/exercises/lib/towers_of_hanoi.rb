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

  def initialize(towers = [[3,2,1],[],[]])
    @towers = towers
    @initial_tower_idx = 0
    @initial_tower_size = towers.size
  end

  def play
    # store_initial_tower
    until won?
      puts "Current state:"
      render
      puts "Select a tower:"
      tower_from = gets.chomp.to_i - 1
      puts "Where are you moving the piece to?"
      tower_to = gets.chomp.to_i - 1
      unless valid_move?(tower_from,tower_to)
        puts "! INVALID MOVE !"
        puts ""
        next
      end
      move(tower_from, tower_to)
    end
    puts "FINISHED!!"
  end

  def render
    num_of_towers = @towers.length
    num_of_towers.times {|tower| print_tower(@towers[tower],tower)}
  end

  def won?
    # byebug
    @towers.each_with_index do |discs,tower|
      return true if tower_fully_ordered?(discs,tower)
    end
    false
  end

  def valid_move?(from_num, to_num)

    from = @towers[from_num]
    to = @towers[to_num]

    #Can't pick from / place on non-existing tower
    return false if from_num+1 > @towers.count || to_num+1 > @towers.count

    #Can't pick from empty tower
    return false if from.empty?

    #No disk may be placed on top of a smaller disk.
    return false if !(to.empty?) && from.last > to.last && to.first != 0

    true

  end

  def move(from_num, to_num)
    from = @towers[from_num]
    to = @towers[to_num]
    @towers[to_num] << @towers[from_num].pop
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

  def store_initial_tower
    initial = 0
    @towers.each_with_index do |tower,idx|

      unless tower.first == 0
        @initial_tower_size = tower.count
        @initial_tower_idx = idx
        break
      end

    end
  end

  def tower_fully_ordered?(discs, tower)
    sorted_discs = (1..@initial_tower_size).to_a.reverse #create array of sorted discs to simulate initial state
    discs.count == @initial_tower_size && discs == sorted_discs && tower != @initial_tower_idx
  end

end
