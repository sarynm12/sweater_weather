class TrailsFacade
  attr_reader :location,
              :geocoding_service,
              :directions_service,
              :forecast_service,
              :trails_service

  def initialize(location)
    @location = location
    @geocoding_service = GeocodingService.new
    @directions_service = DirectionsService.new
    @forecast_service = ForecastService.new
    @trails_service = TrailsService.new
  end

  def retrieve_location
    data = geocoding_service.get_location(location)
    coordinates = data[:results][0][:locations][0][:latLng]
  end

  def trail_data
    trails_service.find_trails(retrieve_location)
  end

end
