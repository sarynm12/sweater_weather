class RoadTripFacade
  attr_reader :origin,
              :destination,
              :distance_service,
              :forecast_data

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    @distance_service = DistanceService.new
    @forecast_data = ForecastFacade.new(destination)
  end

  def travel_minutes
    data = distance_service.get_distance(origin, destination)
    (data[:route][:time] / 60).round
  end

  def travel_time
    hours = (travel_minutes / 60)
    minutes = (travel_minutes % 60)
    if hours <= 1
      time = "#{hours} hour, #{minutes} minutes"
    else
      time = "#{hours} hours, #{minutes} minutes"
    end
    time
  end

  def forecast
    arrival = (travel_minutes / 60).round
    results = forecast_data.hourly_forecast[arrival]
    attrs = {
      temperature: results.temp,
      conditions: results.description
    }
    DestinationForecast.new(attrs)
  end

end
