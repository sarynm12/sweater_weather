require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :password}
  end

  describe 'methods' do
    it 'can generate a random api key' do
      attrs = {
        email: 'whatevs@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      }
      user = User.create(attrs)
      expect(user.api_key).to_not eq(nil)
    end
  end
end
