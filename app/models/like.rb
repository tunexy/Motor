class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :vehicle
  
  validates_uniqueness_of :user, scope: :vehicle
end