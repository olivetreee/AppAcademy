require_relative 'card'

class Board
  attr_reader :grid_size, :grid

  def initialize(number_of_cards)
    @number_of_cards = number_of_cards
    @grid_size = Math.sqrt(@number_of_cards)
    @grid = initialize_grid
  end

  def initialize_grid
    grid = Array.new(@grid_size) {Array.new(@grid_size) {0}}
    all_values = ((1..@number_of_cards/2).to_a * 2).shuffle
    all_cards = all_values.map { |value| Card.new(value) }

    grid = grid.map do |row|
      row.map do |position|
        position = all_cards.pop
      end
    end
    grid
  end

  def [](x,y)
    @grid[x][y]
  end

  def render
    @grid.each do |row|
      row_string = ""
      row.each do |card|
        if card.shown
          row_string << "#{card.value} | "
        else
          row_string << "X | "
        end
      end
      puts row_string
      puts "-" * row_string.length
    end
  end
end
