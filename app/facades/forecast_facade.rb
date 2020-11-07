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
    results = forecast_service.get_forecast(retrieve_location)
  end

  def current_forecast

  end

  def hourly_forecast

  end

  def daily_forecast

  end

end
