class Api::V1::RoadTripsController < ApplicationController

  def create
    user = User.find_by(api_key: road_trip_params[:api_key])
    if user
      render json: RoadTripSerializer.new(RoadTripFacade.new(params[:origin], params[:destination]))
    else
      render json: { 'error': 'You must have a valid api key' }, status: 401
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

end
