require 'rails_helper'

RSpec.describe 'trails request call' do
  it 'can return a list of nearby hiking trails and their associated attributes based on a queried location' do
    get '/api/v1/trails?location=denver,co'

    expect(response).to be_successful
    expect(response.content_type).to include('application/json')

    data = JSON.parse(response.body, symbolize_names: true)

    expect(data).to have_key(:data)
    expect(data[:data]).to have_key(:id)
    expect(data[:data][:id]).to eq(nil)
    expect(data[:data]).to have_key(:type)
    expect(data[:data][:type]).to eq('trail')
    expect(data[:data]).to have_key(:attributes)
    expect(data[:data][:attributes]).to have_key(:trails)
    expect(data[:data][:attributes][:trails]).to be_an(Array)
    data[:data][:attributes][:trails].each do |trail|
      expect(trail).to have_key(:name)
      expect(trail).to have_key(:summary)
      expect(trail).to have_key(:difficulty)
      expect(trail).to have_key(:location)
      expect(trail).to have_key(:distance)
      expect(trail).to have_key(:forecast)
      expect(trail[:forecast]).to have_key(:temp)
      expect(trail[:forecast]).to have_key(:summary)
    end
  end
end
