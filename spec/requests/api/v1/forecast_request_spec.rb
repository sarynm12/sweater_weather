require 'rails_helper'

RSpec.describe 'forecast' do

  it 'can retrieve forecast for a given city' do

    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    expect(response.content_type).to include("application/json")
    json = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
    expect(json).to have_key(:data)
  end

end
