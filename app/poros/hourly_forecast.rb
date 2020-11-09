require 'date'
class HourlyForecast
  attr_reader :dt,
              :temp,
              :wind_speed,
              :wind_deg,
              :description,
              :icon

  def initialize(data)
    @dt = Time.at(data[:dt])
    @temp = data[:temp]
    @wind_speed = data[:wind_speed]
    @wind_deg = cardinal(data[:wind_deg])
    @description = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

  def cardinal(deg)
    val = ((deg/22.5)+0.5)
    dir = ["N","NNE","NE","ENE","E","ESE", "SE", "SSE","S","SSW","SW","WSW","W","WNW","NW","NNW"]
    direction = dir[(val % 16)]
    return direction
  end

end
