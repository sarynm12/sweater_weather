class Api::V1::RoadTripsController < ApplicationController

  def create
    user = User.find_by(api_key: road_trip_params[:api_key])
    start_location = road_trip_params[:origin]
    end_location = road_trip_params[:destination]
    render json: RoadTripSerializer.new(RoadTripFacade.new(params[:origin], params[:destination]))
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

end
