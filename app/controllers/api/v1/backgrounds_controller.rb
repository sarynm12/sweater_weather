class Api::V1::BackgroundsController < ApplicationController

  def show
    render json: BackgroundSerializer.new(BackgroundFacade.new(background_params[:location]))
  end

  private
  def background_params
    params.permit(:location)
  end

end
