class Card
  attr_reader :value, :shown

  def initialize(value)
    @value = value
    @shown = false
  end

  def hide
    @shown = false
  end

  def reveal
    @shown = true
  end

  def match?(card2)
    @value == card2.value
  end
end
