require 'rails_helper'

RSpec.describe 'trail poro' do
  it 'exists' do
    data = {
      name: 'Chattaqua',
      summary: 'So hard',
      difficulty: 'Extreme',
      location: 'Boulder',
      forecast: {
        temp: '48.24',
        summary: 'freezing'
      },
      distance: '40.248'
    }

    trail = Trail.new(data)
    expect(trail).to be_a(Trail)
    expect(trail.name).to eq('Chattaqua')
    expect(trail.summary).to eq('So hard')
    expect(trail.difficulty).to eq('Extreme')
    expect(trail.location).to eq('Boulder')
    expect(trail.forecast[:temp]).to eq('48.24')
    expect(trail.forecast[:summary]).to eq('freezing')
    expect(trail.distance).to eq('40.248')

  end
end
