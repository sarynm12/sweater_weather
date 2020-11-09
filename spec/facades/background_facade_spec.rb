require 'rails_helper'

RSpec.describe BackgroundFacade do
  it 'can return information from our background service' do
    background_facade = BackgroundFacade.new('denver,co')

    results = background_facade.data

    expect(results).to be_a(Hash)
  end

  # it 'can return forecast data after receiving location from geocode service' do
  #   forecast_facade = ForecastFacade.new('denver,co')
  #   forecast_facade.retrieve_location
  #   data = forecast_facade.forecast_data
  #
  #   expect(data).to be_a(Hash)
  #   expect(data).to have_key(:lat)
  #   expect(data).to have_key(:lon)
  #   expect(data).to have_key(:current)
  #   expect(data).to have_key(:hourly)
  #   expect(data).to have_key(:daily)
  # end
end
