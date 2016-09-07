class Ship

  #name
  #size
  #destroyed? - Whether all pieces have been hit
  #pieces_hit - Number of pieces that have been hit
  #body

  attr_reader :type, :name, :size
  attr_accessor :body

  ship_data = Struct.new(:name,:size)

  SHIP_TYPES = {
    a: ship_data.new('Aircraft Carrier',5),
    b: ship_data.new('Battleship',4),
    d: ship_data.new('Destroyer',3),
    p: ship_data.new('Patrol',2),
    r: ship_data.new('Submarine',3),
    s: ship_data.new('Small Boat',1)
  }

  def initialize(type=:s)
    @type = type
    @name = SHIP_TYPES[@type].name
    @size = SHIP_TYPES[@type].size
    @body = build_ship
  end

  def build_ship
    @body = Array.new(@size,@type)
  end

  def pieces_hit
    @body.count(:x)
  end

  def destroyed?
    pieces_hit == @size
  end

  def self.create_random_ship(max_size)
    random_type = select_max_ships(max_size).keys.sample
    Ship.new(random_type)
  end

  def self.ship_types
    SHIP_TYPES
  end

  def self.print_types
    SHIP_TYPES.each do |type,info|
      puts "#{type}, #{info.name}, #{info.size}"
    end
  end

  def self.valid_type?(type)
    SHIP_TYPES.keys.include?(type.to_sym)
  end

  def set_position
  end

  private

  def self.select_max_ships(max_size)
    SHIP_TYPES.select {|type,ship| ship.size <= max_size}
  end



end
