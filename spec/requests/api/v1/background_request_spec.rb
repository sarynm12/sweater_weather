require 'rails_helper'

RSpec.describe 'background' do
  it 'can retrieve background image' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    expect(response.content_type).to include("application/json")

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('image')
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to have_key(:background)
    expect(json[:data][:attributes][:background]).to have_key(:location)
    expect(json[:data][:attributes][:background]).to have_key(:image_url)
    expect(json[:data][:attributes][:background]).to have_key(:credits)
    expect(json[:data][:attributes][:background][:credits]).to have_key(:source)
    expect(json[:data][:attributes][:background][:credits]).to have_key(:author)
    expect(json[:data][:attributes][:background][:credits]).to have_key(:logo)
  end

end

#icon: "http://openweathermap.org/img/wn/#{@current[:weather].first[:icon]}.png"
