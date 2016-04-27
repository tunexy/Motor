json.array!(@insurance_details) do |insurance_detail|
  json.extract! insurance_detail, :id, :licensenumber, :licenseheld, :penaltypoint, :dateofpenalty, :freeclaim, :recentclaim, :claimdate, :yearsdriving, :packing, :homeowner, :kmperyear, :user_id
  json.url insurance_detail_url(insurance_detail, format: :json)
end
