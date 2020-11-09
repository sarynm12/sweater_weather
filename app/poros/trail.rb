class Trail
  attr_reader :name,
              :summary,
              :difficulty,
              :location,
              :distance,
              :forecast

  def initialize(data)
    @name = data[:name]
    @summary = data[:summary]
    @difficulty = data[:difficulty]
    @location = data[:location]
    @distance = data[:distance]
    @forecast = data[:forecast]
  end

end
