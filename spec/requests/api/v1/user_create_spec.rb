require 'rails_helper'

RSpec.describe User do
  before(:each) do
    User.destroy_all
  end

  it 'can successfully create a user' do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'

    }
    params = {
      email: 'whatevs@gmail.com',
      password: 'password',
      password_confirmation: 'password'
    }
    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    expect(response).to be_successful
    expect(response.status).to eq(201)

    user = JSON.parse(response.body, symbolize_names: true)

    expect(user).to be_a(Hash)
    expect(user).to have_key(:id)
    expect(user[:id]).to be_an(Integer)
    expect(user).to have_key(:email)
    expect(user[:email]).to be_a(String)
    expect(user).to have_key(:password_digest)
    expect(user[:password_digest]).to be_a(String)
  end

  it 'will throw an error if a field is left blank' do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'

    }
    params = {
      email: '',
      password: 'password',
      password_confirmation: 'password'
    }
    error = { 'error': 'Fields cannot be left blank' }
    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    user = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    expect(user).to eq(error)
  end

  it 'will throw an error if passwords do not match' do
    headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'

    }
    params = {
      email: 'whatevs@gmail.com',
      password: 'password',
      password_confirmation: 'fjdkajfkljasjlkdsf'
    }
    error = { 'error': 'Your passwords do not match' }
    post '/api/v1/users', headers: headers, params: JSON.generate(params)

    user = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    expect(user).to eq(error)
  end
end
