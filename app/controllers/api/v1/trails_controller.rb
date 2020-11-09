class Api::V1::TrailsController < ApplicationController

  def index
    #get coordinates from mapquest api
    conn = Faraday.new('http://www.mapquestapi.com')
    response = conn.get('/geocoding/v1/address') do |req|
      req.params['key'] = ENV['MAPQUEST_API_KEY']
      req.params['location'] = params[:location]
    end
    coordinates = JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]
    #pass coordinates into trails request
    conn = Faraday.new(url: 'https://www.hikingproject.com')
    response = conn.get('/data/get-trails') do |req|
      req.params['key'] = ENV['TRAILS_API_KEY']
      req.params['lat'] = "#{coordinates[:lat]}"
      req.params['lon'] = "#{coordinates[:lng]}"
    end
    data = JSON.parse(response.body, symbolize_names: true)
    render json: data
  end

end
