class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_type :forecast
  set_id :'nil?'
  attributes :current_forecast, :hourly_forecast, :daily_forecast
end
