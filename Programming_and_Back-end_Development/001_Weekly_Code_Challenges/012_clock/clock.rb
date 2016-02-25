# clock.rb
class Clock
  attr_reader :time

  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @time = Time.new(2000, 1, 1, hour, minute, 0, '+00:00')
  end

  def to_s
    @time.to_s.split(' ')[1][0, 5]
  end

  def +(other)
    @time += (other * 60)
    self
  end

  def -(other)
    @time -= (other * 60)
    self
  end

  def ==(other)
    @time == other.time
  end
end
