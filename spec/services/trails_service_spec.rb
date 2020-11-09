require 'rails_helper'

RSpec.describe TrailsService do
  it 'can consume an API' do
    trails_service = TrailsService.new

    data = {
        coordinates: {from: 'denver,co', to: 'boulder,co'}
      }
    results = trails_service.find_trails(data[:coordinates])

    expect(results).to be_a(Hash)

  end
end
