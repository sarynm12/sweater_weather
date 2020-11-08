class ForecastFacade
  attr_reader :location,
              :geocoding_service,
              :forecast_service,
              :id

  def initialize(location)
    @location = location
    @geocoding_service = GeocodingService.new
    @forecast_service = ForecastService.new
  end

  def retrieve_location
    data = geocoding_service.get_location(location)
    coordinates = data[:results][0][:locations][0][:latLng]
  end

  def forecast_data
    forecast_service.get_forecast(retrieve_location)
  end

  def current_forecast
    current_data = forecast_data[:current]
    CurrentForecast.new(current_data)
  end

  def hourly_forecast
    hourly_data = forecast_data[:hourly][0..7]
    hourly_data.map do |forecast|
      HourlyForecast.new(forecast)
    end
  end

  def daily_forecast
    daily_data = forecast_data[:daily][0..6]
    daily_data.map do |forecast|
      DailyForecast.new(forecast)
    end
  end

end
