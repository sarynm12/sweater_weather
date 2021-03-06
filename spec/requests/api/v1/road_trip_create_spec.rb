require 'rails_helper'

RSpec.describe 'road trip' do
  it 'can create a road trip' do
    user = User.create!(email: 'sowhatevs12@gmail.com', password: '12password12', password_confirmation: '12password12')
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
    params = {
      origin: 'Denver,CO',
      destination: 'Breckenridge,CO',
      api_key: user.api_key
    }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to be_a(String)
    expect(json[:data][:type]).to eq('roadtrip')
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a(Hash)
    expect(json[:data][:attributes]).to have_key(:origin)
    expect(json[:data][:attributes][:origin]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes][:destination]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes][:travel_time]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:forecast)
    expect(json[:data][:attributes][:forecast]).to be_a(Hash)
    expect(json[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(json[:data][:attributes][:forecast][:temperature]).to be_a(Float)
    expect(json[:data][:attributes][:forecast]).to have_key(:conditions)
    expect(json[:data][:attributes][:forecast][:conditions]).to be_a(String)
  end

  it 'throws an error if a user does not have a valid api key' do
    user = User.create!(email: 'whatevs123@gmail.com', password: 'password123', password_confirmation: 'password123')
    error = { 'error': 'Correct API Key required' }

    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
    params = {
      origin: 'Denver,CO',
      destination: 'Breckenridge,CO',
      api_key: ''
    }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)
    expect(response).to_not be_successful

    json = JSON.parse(response.body, symbolize_names: true)
  end

  it 'can complete a long distance request' do
    user = User.create!(email: 'whatevssss12@gmail.com', password: 'password1234', password_confirmation: 'password1234')
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
    params = {
      origin: 'New York,NY',
      destination: 'Los Angeles,CA',
      api_key: user.api_key
    }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(params)
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to be_a(String)
    expect(json[:data][:type]).to eq('roadtrip')
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to be_a(Hash)
    expect(json[:data][:attributes]).to have_key(:origin)
    expect(json[:data][:attributes][:origin]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes][:destination]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes][:travel_time]).to be_a(String)
    expect(json[:data][:attributes]).to have_key(:forecast)
    expect(json[:data][:attributes][:forecast]).to be_a(Hash)
    expect(json[:data][:attributes][:forecast]).to have_key(:temperature)
    expect(json[:data][:attributes][:forecast][:temperature]).to be_a(Float)
    expect(json[:data][:attributes][:forecast]).to have_key(:conditions)
    expect(json[:data][:attributes][:forecast][:conditions]).to be_a(String)
  end
end
