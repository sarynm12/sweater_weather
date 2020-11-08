require 'rails_helper'

RSpec.describe GeocodingService do
  it 'can consume an API' do
    location = 'denver,co'
    results = GeocodingService.new.get_location(location)
    
    expect(results).to be_a(Hash)
  end
end
