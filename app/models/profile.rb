class Profile < ActiveRecord::Base
  
  
  
  has_attached_file :avatar, styles: { large: "700x600#", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/download.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
