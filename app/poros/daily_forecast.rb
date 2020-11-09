require 'date'
class DailyForecast
  attr_reader :dt,
              :sunrise,
              :sunset,
              :max,
              :min,
              :description,
              :icon

  def initialize(data)
    @dt = Time.at(data[:dt])
    @sunrise = Time.at(data[:sunrise])
    @sunset = Time.at(data[:sunset])
    @max = data[:temp][:max].to_f
    @min = data[:temp][:min].to_f
    @description = data[:weather].first[:description]
    @icon = data[:weather].first[:icon]
  end

end
