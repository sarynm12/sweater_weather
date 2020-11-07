class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :forecast
  set_id :'nil?'
  attributes :retrieve_location, :current_forecast, :hourly_forecast, :daily_forecast
end
