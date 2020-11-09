class TrailsService

  def find_trails(location)
    response = conn.get('/data/get-trails') do |req|
      req.params[:lat] = location[:lat]
      req.params[:lon] = location[:lng]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: 'https://www.hikingproject.com') do |req|
      req.params['key'] = ENV['TRAILS_API_KEY']
    end
  end
end
