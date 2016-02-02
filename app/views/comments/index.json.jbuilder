json.array!(@comments) do |comment|
  json.extract! comment, :id, :rating, :message, :offer, :user_id, :advert_id
  json.url comment_url(comment, format: :json)
end
