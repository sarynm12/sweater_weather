require 'rails_helper'
require 'date'

RSpec.describe 'current forecast poro' do
  it 'can create a current forecast poro' do
    attrs = {
      dt: 1600692843,
      temp: 280.19324,
      feels_like: 279.43282,
      humidity: 71,
      visibility: 10000,
      uvi: 6.67,
      sunrise: 1600692427,
      sunset: 1600736311,
      weather: [{
        description: 'Clouds',
      icon: '12b'
    }]
  }
    current_weather = CurrentForecast.new(attrs)

    expect(current_weather).to be_a(CurrentForecast)
    expect(current_weather.dt).to eq('2020-09-21 06:54:03 -0600')
    expect(current_weather.temp).to eq(280)
    expect(current_weather.feels_like).to eq(279)
    expect(current_weather.humidity).to eq(71)
    expect(current_weather.visibility).to eq(10000)
    expect(current_weather.uvi).to eq(6.67)
    expect(current_weather.sunrise).to eq('2020-09-21 06:47:07 -0600')
    expect(current_weather.sunset).to eq('2020-09-21 18:58:31 -0600')
    expect(current_weather.description).to eq('Clouds')
    expect(current_weather.icon).to eq('12b')
  end
end
