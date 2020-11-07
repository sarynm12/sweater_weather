require 'rails_helper'
require 'date'

RSpec.describe 'hourly forecast poro' do
  it 'can create an hourly forecast poro' do
    attrs = {
      dt: 1600692843,
      wind_speed: 12.48,
      wind_direction: 'abcd',
      conditions: 'Sunny',
      icon: '12b'
  }
    hourly_weather = HourlyForecast.new(attrs)

    expect(hourly_weather).to be_a(HourlyForecast)
    expect(hourly_weather.dt).to eq('2020-09-21 06:54:03 -0600')
    expect(hourly_weather.wind_speed).to eq(12.48)
    expect(hourly_weather.wind_direction).to eq('abcd')
    expect(hourly_weather.conditions).to eq('Sunny')
    expect(hourly_weather.icon).to eq('12b')
  end
end
