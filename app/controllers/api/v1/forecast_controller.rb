class Api::V1::ForecastController < ApplicationController

  def show
    render json: ForecastSerializer.new(ForecastFacade.new(forecast_params[:location]))
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
