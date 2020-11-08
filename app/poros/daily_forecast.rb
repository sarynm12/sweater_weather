require 'date'
class DailyForecast
  attr_reader :dt,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(data)
    @dt = Time.at(data[:dt])
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
    @max_temp = data[:max_temp]
    @min_temp = data[:min_temp]
    @conditions = data[:conditions]
    @icon = data[:icon]
  end

end
