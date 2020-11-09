require 'rails_helper'

RSpec.describe TrailsFacade do
  it 'can return location from our geocode service' do
    trails_facade = TrailsFacade.new('denver,co')
    
    # results = forecast_facade.retrieve_location
    #
    expect(results).to be_a(Hash)
    # expect(results[:lat]).to eq(39.738453)
    # expect(results[:lng]).to eq(-104.984853)
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
