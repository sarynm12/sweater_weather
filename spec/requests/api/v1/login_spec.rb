require 'rails_helper'

RSpec.describe 'user login' do
  it 'can allow a user to login' do
    user = User.create!(email: 'whatevs@gmail.com', password: 'password', password_confirmation: 'password')
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
    params = {
      email: 'whatevs@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(params)
    expect(response).to be_successful
    expect(response.status).to eq(200)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to be_a(Hash)
    expect(user).to have_key(:data)
    expect(user[:data]).to have_key(:id)
    expect(user[:data][:id]).to be_a(String)
    expect(user[:data]).to have_key(:type)
    expect(user[:data][:type]).to be_a(String)
    expect(user[:data]).to have_key(:attributes)
    expect(user[:data][:attributes]).to have_key(:email)
    expect(user[:data][:attributes][:email]).to be_a(String)
    expect(user[:data][:attributes]).to have_key(:api_key)
    expect(user[:data][:attributes][:api_key]).to be_a(String)
    expect(user[:data][:attributes]).to_not have_key(:password)
    expect(user[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'will return a general error message if user credentials are not valid' do
    user = User.create!(email: 'whatever@gmail.com', password: 'password123', password_confirmation: 'password123')
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }
    params = {
      email: 'whatevs@gmail.com',
      password: 'password123',
      password_confirmation: 'password123'
    }

    error = { 'error': 'Credentials are Bad' }

    post '/api/v1/sessions', headers: headers, params: JSON.generate(params)
    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    user = JSON.parse(response.body, symbolize_names: true)
    expect(user).to eq(error)
  end

end
