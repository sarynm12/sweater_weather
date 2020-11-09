class TrailsFacade
  attr_reader :location,
              :geocoding_service,
              :directions_service,
              :forecast_service,
              :trails_service,
              :id

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

  def distance
    trail = trail_data[:trails][0][:location]
    data = directions_service.get_directions(location, trail)
    data[:route][:legs][0][:distance]
  end

  def forecast
    data = forecast_service.get_forecast(retrieve_location)
    forecast = {
      temp: data[:current][:temp],
      summary: data[:current][:weather].first[:description]
    }
  end

  def trails
    trail_data[:trails].map do |data|
      data = {
        name: data[:name],
        summary: data[:summary],
        difficulty: data[:difficulty],
        location: data[:location],
        distance: distance,
        forecast: forecast
      }
      Trail.new(data)
    end
  end
end
