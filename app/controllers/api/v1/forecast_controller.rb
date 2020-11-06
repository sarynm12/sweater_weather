class Api::V1::ForecastController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.openweathermap.org")
    response = conn.get("/data/2.5/weather") do |req|
      req.params['q'] = 'denver'
      req.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
    end
    data = JSON.parse(response.body, symbolize_names: true)
    forecast = data[:weather]
  end
end


# req.params['lat'] = 39.74
# req.params['lon'] = -104.99
# req.params['exclude'] = 'minutely'
# req.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
# end
# response = conn.get('/data/2.5/weather') do |req|
