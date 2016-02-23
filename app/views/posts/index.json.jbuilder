json.array!(@posts) do |post|
  json.extract! post, :id, :rating, :message, :offer, :user_id, :vehicle_id
  json.url post_url(post, format: :json)
end
