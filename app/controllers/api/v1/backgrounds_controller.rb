class Api::V1::BackgroundsController < ApplicationController

  def show
    query = params[:location]
    background = BackgroundFacade.new(query).get_photo
    render json: background
  end

end
