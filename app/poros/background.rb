class Background
  attr_reader :location,
              :image_url,
              :credits

  def initialize(attrs)
    @location = attrs[:location]
    @image_url = attrs[:image_url]
    @credits = attrs[:credits]
  end

end
