class Card
  attr_accessor :numeric_value
  attr_reader :value, :suit

  STRING_VALUES = {
    "2" => "Two",
    "3" => "Three",
    "4" => "Four",
    "5" => "Five",
    "6" => "Six",
    "7" => "Seven",
    "8" => "Eight",
    "9" => "Nine",
    "10" => "Ten",
    "J" => "Jack",
    "Q" => "Queen",
    "K" => "King",
    "A" => "Ace"
  }

  def initialize(value, suit)
    @numeric_value = value
    self.value = value
    self.suit = suit
  end

  def value=(val)
    raise "Invalid value" unless (2..14).cover?(val)
    @value = valid_values[val-2]
  end


  def suit=(val)
    unless [:heart, :diamond, :club, :spade].include?(val)
      raise "Invalid suit"
    end

    @suit = val
  end

  def to_s
    "#{STRING_VALUES[@value]} of #{@suit.to_s.capitalize}s"
  end

  def <=>(other_card)
    @numeric_value <=> other_card.numeric_value
  end

  private

  def valid_values
    (2..10).to_a.map(&:to_s) + ["J", "Q", "K", "A"]
  end

end
