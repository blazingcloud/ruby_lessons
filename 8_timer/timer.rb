class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    sprintf("00|%02d|%02d", @seconds/60, @seconds%60)
  end
end
