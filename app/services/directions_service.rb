class DirectionsService

  def get_directions(from, to)
    response = conn.get('directions/v2/route?') do |req|
      req.params['key'] = ENV['MAPQUEST_API_KEY']
      req.params['from'] = "#{from}"
      req.params['to'] = "#{to}"
    end
    json = JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('http://www.mapquestapi.com')
  end
end
