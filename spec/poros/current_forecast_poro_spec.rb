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
      weather_condition: 'Partly Cloudy'
  }
    current_weather = CurrentForecast.new(attrs)

    expect(current_weather).to be_a(CurrentForecast)
  end
end
