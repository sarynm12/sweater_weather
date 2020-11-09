class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_type :image
  set_id :'nil?'
  attributes :background
end
