require 'rails_helper'

RSpec.describe 'forecast' do

  it 'can retrieve forecast for a given city' do
    

    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end

end
