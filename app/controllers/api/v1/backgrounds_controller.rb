class Api::V1::BackgroundsController < ApplicationController

  def show
    query = params[:location]
    conn = Faraday.new(url: 'https://api.unsplash.com/') do |req|
      req.headers['Accept-Version'] = 'v1'
      req.params['client_id'] = ENV['UNSPLASH_API_KEY']
    end
    response = conn.get('search/photos') do |req|
      req.params['query'] = query
    end
    data = JSON.parse(response.body, symbolize_names: true)
    render json: data
  end

end
