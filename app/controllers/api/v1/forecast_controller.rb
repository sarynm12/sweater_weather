class Api::V1::ForecastController < ApplicationController

  def show
    conn = Faraday.new('http://www.mapquestapi.com')
    response = conn.get('/geocoding/v1/address') do |req|
      req.params['key'] = ENV['MAPQUEST_API_KEY']
      req.params['location'] = params[:location]
    end
    require "pry"; binding.pry
    coordinates = JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0][:latLng]

    conn = Faraday.new(url: "https://api.openweathermap.org") do |req|
      req.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
    end
    response = conn.get("/data/2.5/onecall") do |req|
      req.params['lat'] = "#{coordinates[:lat]}"
      req.params['lon'] = "#{coordinates[:lng]}"
      req.params['exclude'] = 'minutely'
    end
    data = JSON.parse(response.body, symbolize_names: true)
    render json: data
  end
end

# req.params['q'] = params[:location]
# req.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
