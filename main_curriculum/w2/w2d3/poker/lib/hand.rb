class Hand

  attr_reader :cards

  def initialize(deck)
    @deck = deck
    @cards = @deck.deal_cards(5)
  end

  def discard(*indexes)
    indexes.sort.reverse.each { |idx| @cards.delete_at(idx) }
    @cards += @deck.deal_cards(indexes.length)
  end

  def hand_value
    get_sequence_value + get_cards_value
  end

  def <=>(other_hand)
    hand_value <=> other_hand.hand_value
  end

  def to_s
    if is_straight_flush?
      "Straight Flush"
    elsif is_four_of_a_kind?
      "Four of a kind"
    elsif is_full_house?
      "Full House"
    elsif is_flush?
      "Flush"
    elsif is_straight?
      "Straight"
    elsif is_three_of_a_kind?
      "Three of a kind"
    elsif is_two_pair?
      "Two pair"
    elsif is_pair?
      "Pair"
    else
      "High Card"
    end
  end

private
  def get_cards_value
    @cards.sort!.reverse!

    powers = 4

    @cards.inject(0) do |sum, card|
      sum += 14 ** powers * card.numeric_value
      powers -= 1
      sum
    end
  end

  def get_sequence_value
    if is_straight_flush?
      8_000_000
    elsif is_four_of_a_kind?
      7_000_000
    elsif is_full_house?
      6_000_000
    elsif is_flush?
      5_000_000
    elsif is_straight?
      4_000_000
    elsif is_three_of_a_kind?
      3_000_000
    elsif is_two_pair?
      2_000_000
    elsif is_pair?
      1_000_000
    else
      0
    end
  end

  def highest_card_value
      @cards.sort.last.numeric_value
  end

  def is_royal_flush?
    is_straight_flush? && highest_card_value == 14
  end

  def is_straight_flush?
    is_flush? && is_straight?
  end

  def is_four_of_a_kind?
    cards_that_contain_same_value(4)
  end

  def is_full_house?
    is_three_of_a_kind? && is_pair?
  end

  def is_flush?
    @cards.all?{ |card| card.suit == @cards[0].suit}
  end

  def is_straight?
    @cards.sort!
    @cards.take(4).each_with_index do |card, idx|
      unless @cards[idx + 1].numeric_value - card.numeric_value == 1
        return false
      end
    end
    true
  end

  def is_three_of_a_kind?
    cards_that_contain_same_value(3)
  end

  def is_two_pair?
    pair_counts = 0
    @cards.each do |card|
      count = @cards.count do |card_2|
        card_2.numeric_value == card.numeric_value
      end
      pair_counts += 1 if count == 2
    end
    pair_counts == 4 # four cards are found exactly twice, each pair has two cards that are found twice
  end

  def is_pair?
    cards_that_contain_same_value(2)
  end

  def cards_that_contain_same_value(num)
    @cards.any? do |card|
      count = @cards.count do |card_2|
        card_2.numeric_value == card.numeric_value
      end
      count == num
    end
  end
end
