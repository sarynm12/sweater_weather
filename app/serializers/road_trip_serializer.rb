class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  set_id :'nil?'
  set_type :'roadtrip'
  attributes :origin, :destination, :travel_time, :forecast
end
