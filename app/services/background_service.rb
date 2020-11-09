class BackgroundService

  def photo_call(query)
    conn = Faraday.new(url: 'https://api.unsplash.com/') do |req|
      req.headers['Accept-Version'] = 'v1'
      req.params['client_id'] = ENV['UNSPLASH_API_KEY']
    end
    response = conn.get('search/photos') do |req|
      req.params['query'] = query
    end
    data = JSON.parse(response.body, symbolize_names: true)
  end

end
