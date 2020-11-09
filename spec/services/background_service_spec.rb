require 'rails_helper'

RSpec.describe BackgroundService do
  it 'can consume an API' do
    query = 'denver,co'
    data = BackgroundService.new.photo_call(query)

    expect(data).to be_a(Hash)
    expect(data).to have_key(:results)
    expect(data[:results]).to be_an(Array)
    expect(data[:results][0]).to have_key(:urls)
    expect(data[:results][0]).to have_key(:user)
  end
end
