require 'date'
class HourlyForecast
  attr_reader :dt,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(data)
    @dt = Time.at(data[:dt])
    @wind_speed = data[:wind_speed]
    @wind_direction = data[:wind_direction]
    @conditions = data[:conditions]
    @icon = data[:icon]
  end

end
