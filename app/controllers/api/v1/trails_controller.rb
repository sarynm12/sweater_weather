class Api::V1::TrailsController < ApplicationController

  def index
    render json: TrailSerializer.new(TrailsFacade.new(trail_params[:location]))
  end

  private

  def trail_params
    params.permit(:location)
  end

end
