class Tile
attr_accessor :value
attr_reader :given

  def initialize(value)
    @value = value
    @given = value == 0 ? false : true
  end

  def value=(new_value)
    if @given
      puts "This tile was given. You can't change its value."
      puts
    else
      @value = new_value
    end
  end
end
