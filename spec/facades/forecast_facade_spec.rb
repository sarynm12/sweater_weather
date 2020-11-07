require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'can return location from our geocode service' do
    forecast_facade = ForecastFacade.new('denver,co')

    results = forecast_facade.retrieve_location

    expect(results).to be_a(Hash)
    expect(results[:lat]).to eq(39.738453)
    expect(results[:lng]).to eq(-104.984853)
  end
end
