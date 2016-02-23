class Profile < ActiveRecord::Base
  belongs_to :user
  
  has_attached_file :avatar, styles: { large: "700x600#", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/download.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  validates :user_id, presence: true

  validates :title, :firstname, :lastname, :dateofbirth, :martialstatus,
  :phonenumber, :address, :city, :country, presence: true
  
  validates :firstname, :lastname, 
    length: { in: 2..20, too_long: "%{count} characters is the maximum allowed" }
    
  validate do
    if dateofbirth && dateofbirth < Date.today
    else
      errors[:dateofbirth] << "Date Of Birth  Can not be a date in the future"
    end
  end
end
