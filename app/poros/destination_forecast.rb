class DestinationForecast
  attr_reader :temperature,
              :conditions

  def initialize(attrs)
    @temperature = attrs[:temperature]
    @conditions = attrs[:conditions]
  end

end 
