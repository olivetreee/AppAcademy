require 'byebug'
class Temperature

  attr_reader :temperature

  def initialize(temp_hash)
    @scale, @temperature = temp_hash.first
  end

  def in_fahrenheit
    return @temperature if @scale == :f
    self.class.ctof(@temperature)
  end

  def in_celsius
    return @temperature if @scale == :c
    self.class.ftoc(@temperature)
  end

  def self.ftoc(temp)
    5.0/9*(temp - 32)
  end

  def self.ctof(temp)
    9.0/5*temp + 32
  end


  def self.from_celsius(temp)
    Temperature.new(c: temp)
  end

  def self.from_fahrenheit(temp)
    Temperature.new(f: temp)
  end
end

class Celsius < Temperature
  def initialize(temp)
    @scale = :c
    @temperature = temp
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    @scale = :f
    @temperature = temp
  end
end
