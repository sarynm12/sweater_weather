require 'rails_helper'

RSpec.describe ForecastService do
  it 'can consume an API' do
    forecast_service = ForecastService.new
    data = {
        coordinates: {lat: 55.7558, lng: 37.6173}
      }
    results = forecast_service.get_forecast(data[:coordinates])
    expect(data).to be_a(Hash)
  end
end
