require 'rails_helper'

RSpec.describe DirectionsService do
  it 'can consume an API and return distance from start location to end location' do
    directions_service = DirectionsService.new

    from = 'denver,co'
    to = 'boulder,co'
    results = directions_service.get_directions(from, to)

    expect(results).to be_a(Hash)
    expect(results).to have_key(:route)
    expect(results[:route]).to have_key(:distance)
  end

end
