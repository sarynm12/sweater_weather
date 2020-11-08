require 'rails_helper'
require 'date'

RSpec.describe 'daily forecast poro' do
  it 'can create a daily forecast poro' do
    attrs = {
      dt: 1600692843,
      sunrise: 1604756162,
      sunset: 1604793077,
      max_temp: 72.32,
      min_temp: 56.91,
      conditions: 'Clouds',
      icon: '12b'
  }
    daily_weather = DailyForecast.new(attrs)

    expect(daily_weather).to be_a(DailyForecast)
    expect(daily_weather.dt).to eq('2020-09-21 06:54:03 -0600')
    expect(daily_weather.sunrise).to eq('2020-11-07 06:36:02 -0700')
    expect(daily_weather.sunset).to eq('2020-11-07 16:51:17 -0700')
    expect(daily_weather.conditions).to eq('Clouds')
    expect(daily_weather.icon).to eq('12b')
  end
end
