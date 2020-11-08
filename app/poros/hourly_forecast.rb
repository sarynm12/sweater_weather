require 'date'
class HourlyForecast
  attr_reader :dt,
              :wind_speed,
              :wind_deg,
              :description,
              :icon

  def initialize(data)
    @dt = Time.at(data[:dt])
    @wind_speed = data[:wind_speed]
    @wind_deg = data[:wind_deg]
    @description = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

end
