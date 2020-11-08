class GeocodingService

  def get_location(location)
    response = conn.get('/geocoding/v1/address') do |req|
      req.params['key'] = ENV['MAPQUEST_API_KEY']
      req.params['location'] = "#{location}"
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('http://www.mapquestapi.com')
  end
end
