class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :retrieve_location, :current_forecast, :hourly_forecast, :daily_forecast
end
