require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'can return travel minutes from origin to destination' do
    origin = 'denver,co'
    destination = 'breckenridge,co'

    road_trip_facade = RoadTripFacade.new(origin, destination)

    results = road_trip_facade.travel_minutes

    expect(results).to be_an(Integer)
    expect(results).to eq(87)
  end

  it 'can format travel minutes to hours and minutes' do
    origin = 'denver,co'
    destination = 'breckenridge,co'
    road_trip_facade = RoadTripFacade.new(origin, destination)

    results = road_trip_facade.travel_time
    expect(results).to eq("1 hour, 27 minutes")
  end

  it 'can return a forecast for a given destination' do
    origin = 'denver,co'
    destination = 'breckenridge,co'
    road_trip_facade = RoadTripFacade.new(origin, destination)

    results = road_trip_facade.forecast

    expect(results.temperature).to be_a(Float)
    expect(results.conditions).to be_a(String)
  end
end
