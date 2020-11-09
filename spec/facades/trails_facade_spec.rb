require 'rails_helper'

RSpec.describe TrailsFacade do
  it 'can return location from our geocode service' do
    trails_facade = TrailsFacade.new('denver,co')
    data = trails_facade.trail_data

    expect(data).to be_a(Hash)
    expect(data).to have_key(:trails)
    expect(data[:trails]).to be_an(Array)
    expect(data[:trails][0]).to have_key(:id)
    expect(data[:trails][0]).to have_key(:name)
    expect(data[:trails][0]).to have_key(:summary)
    expect(data[:trails][0]).to have_key(:difficulty)
    expect(data[:trails][0]).to have_key(:location)
  end

  it 'can lay out data to create a trail poro' do
    trails_facade = TrailsFacade.new('denver,co')
    data = trails_facade.trails

    expect(data).to be_an(Array)
  end

end
