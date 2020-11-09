require 'rails_helper'

RSpec.describe TrailsService do
  it 'can consume an API' do
    trails_service = TrailsService.new

    data = {
        coordinates: {lat: 39.74, lng: -104.99}
      }
    results = trails_service.find_trails(data[:coordinates])

    expect(results).to be_a(Hash)
    expect(results).to have_key(:trails)
    expect(results[:trails][0]).to have_key(:name)
    expect(results[:trails][0]).to have_key(:summary)
    expect(results[:trails][0]).to have_key(:difficulty)
    expect(results[:trails][0]).to have_key(:location)
  end
end
