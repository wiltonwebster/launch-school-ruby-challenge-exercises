# Clock

=begin
Create a clock that is independent of date.

You should be able to add minutes to and subtract minutes from the time 
represented by a given Clock object. Note that you should not mutate Clock 
objects when adding and subtracting minutes -- create a new Clock object.

Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic 
operations.
=end

class Clock
  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end
  
  def initialize(hour, minute = 0)
    @hour = hour
    @minute = minute
  end
  
  def to_s
    sprintf("%02d:%02d", hour, minute)
  end
  
  def ==(other_clock)
    hour == other_clock.hour && minute == other_clock.minute
  end
  
  def +(minutes)
    new_hour, new_minute = change_time_by(minutes)
    Clock.new(new_hour, new_minute)
  end
  
  def -(minutes)
    new_hour, new_minute = change_time_by(-minutes)
    Clock.new(new_hour, new_minute)
  end
  
  private
  
  def change_time_by(minutes)
    hour_change, new_minute = (self.minute + minutes).divmod(60)
    new_hour = (self.hour + hour_change) % 24
    [new_hour, new_minute]
  end
  
  protected
  
  attr_reader :hour, :minute
end
