class BackgroundFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def get_photo
    background_service = BackgroundService.new
    background_service.photo_call(location)
  end

  def background
    attrs = {
      location: @location,
      image_url: get_photo[:results][0][:urls][:raw],
      credits: get_credits
    }
    Background.new(attrs)
  end

  def get_credits
    {
      source: 'https://unsplash.com/',
      author: get_photo[:results][0][:user][:username],
      logo: 'https://unsplash-assets.imgix.net/marketing/press-symbol.svg?auto=format&fit=crop&q=60'
    }
  end

end

# Time.at(data.first[:dt]).strftime("%k:%M:%S") 
# Time.at(data.first[:dt]).strftime("%Y/%d/%m")
