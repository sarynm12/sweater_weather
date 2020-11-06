class GeocodingFacade
  attr_reader :location,
              :service

  def initialize(location)
    @location = location
    @service = GeocodingService.new
  end

  def get_latitude_and_longitude
    latitude_and_longitude = service.get_location(location)
    latitude_and_longitude[:results][0][:locations][0][:latLng]
  end

end
