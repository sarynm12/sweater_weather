class Api::V1::TrailsController < ApplicationController

  def index
    location = params[:location]
    #get coordinates from mapquest api
    # geocoding = GeocodingFacade.new(location)
    # coordinates = geocoding.get_latitude_and_longitude
    #pass coordinates into trails request
    trails = TrailsFacade.new(location)
    data = trails.trail_data
    require "pry"; binding.pry
    #data = TrailsService.new.find_trails(location)
    #trails = TrailsFacade.new(location)
    # conn = Faraday.new(url: 'https://www.hikingproject.com')
    # response = conn.get('/data/get-trails') do |req|
    #   req.params['key'] = ENV['TRAILS_API_KEY']
    #   req.params['lat'] = "#{coordinates[:lat]}"
    #   req.params['lon'] = "#{coordinates[:lng]}"
    # end
    data = JSON.parse(response.body, symbolize_names: true)
    render json: data
  end

end
