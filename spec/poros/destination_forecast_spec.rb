require 'rails_helper'

RSpec.describe 'destination forecast poro' do
  it 'can create a destination poro' do
    attrs = {
      temperature: 48.24,
      conditions: "cold"
      }

    forecast = DestinationForecast.new(attrs)

    expect(forecast).to be_a(DestinationForecast)
    expect(forecast.temperature).to eq(48.24)
    expect(forecast.conditions).to eq("cold")
  end
end
