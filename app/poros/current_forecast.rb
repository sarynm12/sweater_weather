require 'date'
class CurrentForecast
  attr_reader :dt,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :weather_condition,
              :icon

  def initialize(data)
    @dt = Time.at(data[:dt])
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
    @temp = data[:temp].round(0)
    @feels_like = data[:feels_like].round(0)
    @humidity = data[:humidity]
    @uvi = data[:uvi]
    @visibility = data[:visibility]
    @weather_condition = data[:weather_condition]
    @icon = data[:icon]
  end

end
