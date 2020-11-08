class ForecastService

  def get_forecast(location)
    response = conn.get("/data/2.5/onecall") do |req|
      req.params[:lat] = location[:lat]
      req.params[:lon] = location[:lng]
      req.params[:units] = 'imperial'
      req.params[:exclude] = 'minutely'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://api.openweathermap.org") do |req|
      req.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
    end
  end
end
