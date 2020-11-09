class TrailSerializer
  include FastJsonapi::ObjectSerializer
  set_type :trail
  set_id :'nil?'
  attributes :trails
end
