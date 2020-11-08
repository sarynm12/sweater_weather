require 'rails_helper'

RSpec.describe 'background' do
  it 'can retrieve background image' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    expect(response.content_type).to include("application/json")

    json = JSON.parse(response.body, symbolize_names: true)


  end

end
