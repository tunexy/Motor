json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :description, :make, :model, :year, :enginesize, :cupiccapacity, :price, :bodytype, :fueltype, :milleage, :transmission, :taxdue, :nctdue, :platenumber, :user_id
  json.url vehicle_url(vehicle, format: :json)
end
