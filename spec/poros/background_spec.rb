require 'rails_helper'

RSpec.describe 'background poro' do
  it 'can create a background poro' do
    attrs = {
      location: 'denver,co',
      image_url: 'https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE4MDgzMn0',
      credits: {
      source: 'https://unsplash.com/',
      author: 'Stubz',
      logo: 'https://unsplash-assets.imgix.net/marketing/press-symbol.svg?auto=format&fit=crop&q=60'
    }}

    background = Background.new(attrs)

    expect(background).to be_a(Background)
    expect(background.location).to eq('denver,co')
    expect(background.image_url).to eq('https://images.unsplash.com/photo-1578983427937-26078ee3d9d3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE4MDgzMn0')
    expect(background.credits[:source]).to eq('https://unsplash.com/')
    expect(background.credits[:author]).to eq('Stubz')
    expect(background.credits[:logo]).to eq('https://unsplash-assets.imgix.net/marketing/press-symbol.svg?auto=format&fit=crop&q=60')    
  end

end
