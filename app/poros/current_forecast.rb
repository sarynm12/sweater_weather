require 'date'

class CurrentForecast
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temp,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(attrs)
    @datetime = Time.at(attrs[:dt])
    @sunrise = Time.at(attrs[:sunrise])
    @sunset = Time.at(attrs[:sunset])
    @temp = attrs[:temp]
    @feels_like = attrs[:feels_like]
    @humidity = attrs[:humidity]
    @uvi = attrs[:uvi]
    @visibility = attrs[:visibility]
    @conditions = attrs[:weather][0][:main]
    @icon = attrs[:weather][0][:icon]
  end

end
