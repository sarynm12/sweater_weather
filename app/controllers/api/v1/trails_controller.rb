class Api::V1::TrailsController < ApplicationController

  def index
    location = params[:location]
    #get coordinates from mapquest api
    # geocoding = GeocodingFacade.new(location)
    # coordinates = geocoding.get_latitude_and_longitude
    #pass coordinates into trails request
    trails = TrailsFacade.new(location)
    response = trails.trail_data
    render json: response
    # data = JSON.parse(response.body, symbolize_names: true)
    # render json: data
  end

end
