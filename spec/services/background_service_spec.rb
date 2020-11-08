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

    # attrs = {
    #   location: 'denver,co',
    #   image_url: 'https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE4MDgzMn0',
    #   credits: {
    #   source: 'https://unsplash.com/',
    #   author: get_photo[:results][0][:user][:username],
    #   logo: 'https://unsplash-assets.imgix.net/marketing/press-symbol.svg?auto=format&fit=crop&q=60'
    # }}

  end
end
