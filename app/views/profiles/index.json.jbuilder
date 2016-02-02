json.array!(@profiles) do |profile|
  json.extract! profile, :id, :title, :firstname, :lastname, :dateofbirth, :martialstatus, :phonenumber, :employmentstatus, :address, :city, :country, :user_id
  json.url profile_url(profile, format: :json)
end
