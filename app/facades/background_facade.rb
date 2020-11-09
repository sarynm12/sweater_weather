class BackgroundFacade
  attr_reader :location,
              :background_service

  def initialize(location)
    @location = location
    @background_service = BackgroundService.new
  end

  def data
    @background_service.photo_call(location)
  end

  def background
    attrs = {
      location: @location,
      image_url: data[:results][0][:urls][:raw],
      credits: get_credits
    }
    Background.new(attrs)
  end

  def get_credits
    {
      source: 'https://unsplash.com/',
      author: data[:results][0][:user][:username],
      logo: 'https://unsplash-assets.imgix.net/marketing/press-symbol.svg?auto=format&fit=crop&q=60'
    }
  end

end

# Time.at(data.first[:dt]).strftime("%k:%M:%S") 
# Time.at(data.first[:dt]).strftime("%Y/%d/%m")
