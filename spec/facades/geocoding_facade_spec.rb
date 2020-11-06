require 'rails_helper'

RSpec.describe GeocodingFacade do
  it 'can find latitude and longitude' do
    geocode = GeocodingFacade.new('denver,co')
    results = geocode.get_latitude_and_longitude

    expect(results).to be_a(Hash)
    expect(results[:lat]).to eq(39.738453)
    expect(results[:lng]).to eq(-104.984853)
  end
end
