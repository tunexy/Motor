class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :vehicle
    
  validates :user_id, presence: true
  validates :vehicle_id, presence: true

  validates :rating, numericality: true
  
  validates_numericality_of :rating, :greater_than => 0, :less_than => 10
  
  validates :message, presence: true, 
    length: { maximum: 300, too_long: "%{count} characters is the maximum allowed" }

end
