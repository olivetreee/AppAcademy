class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    hours = padded(@seconds/3600)
    @seconds %= 3600

    mins = padded(@seconds/60)

    secs = padded(@seconds % 60)

    @time = "#{hours}:#{mins}:#{secs}"
  end

  def padded(num)
    num_str = num.to_s
    num_str = num_str.length == 1 ? "0#{num_str}" : num_str
  end

end
