require 'rails_helper'

RSpec.describe ForecastService do
  it 'can consume an API' do
    forecast_service = ForecastService.new
    data = {
        coordinates: {lat: 55.7558, lng: 37.6173}
      }
    results = forecast_service.get_forecast(data[:coordinates])

    expect(results).to be_a(Hash)
    expect(results).to have_key(:lat)
    expect(results).to have_key(:lon)
    expect(results).to have_key(:timezone)
    expect(results).to have_key(:timezone_offset)
    expect(results).to have_key(:current)
    expect(results).to have_key(:hourly)
    expect(results).to have_key(:daily)
    expect(results).to_not have_key(:minutely)
  end
end
