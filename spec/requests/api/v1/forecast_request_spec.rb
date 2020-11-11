require 'rails_helper'

RSpec.describe 'forecast' do
  it 'can retrieve forecast for a given city', :vcr do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    expect(response.content_type).to include("application/json")

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq("forecast")
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to have_key(:current_forecast)
    expect(json[:data][:attributes]).to have_key(:daily_forecast)
    expect(json[:data][:attributes]).to have_key(:hourly_forecast)

    expect(json[:data][:attributes][:current_forecast]).to_not have_key(:minutely)
    expect(json[:data][:attributes][:daily_forecast][0]).to_not have_key(:minutely)
    expect(json[:data][:attributes][:hourly_forecast][0]).to_not have_key(:minutely)
  end

  it 'throws an error if no location is passed' do
    get '/api/v1/forecast?location='

    error = { 'error': 'No location specified' }
    
    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to eq(error)
  end
end
