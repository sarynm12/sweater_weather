require 'rails_helper'

RSpec.describe User do
  before(:each) do
    User.destroy_all
  end

  it 'can create a user' do
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
  end
end
