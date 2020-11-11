class Api::V1::ForecastController < ApplicationController

  def show
    if params[:location].nil? || params[:location].empty?
      render json: { 'error': 'No location specified' }, status: 400
    else
      render json: ForecastSerializer.new(ForecastFacade.new(forecast_params[:location]))
    end
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
