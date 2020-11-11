class DistanceService

  def get_distance(origin, destination)
    response = conn.get('directions/v2/route?') do |req|
      req.params['key'] = ENV['MAPQUEST_API_KEY']
      req.params['from'] = "#{origin}"
      req.params['to'] = "#{destination}"
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('http://www.mapquestapi.com')
  end
end
