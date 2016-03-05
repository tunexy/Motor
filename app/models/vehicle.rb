class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :assets
  has_many :posts, dependent: :delete_all
  
  accepts_nested_attributes_for :assets, allow_destroy: true
  
  has_attached_file :image, styles: { large: "450x350>", medium: "350x400>", 
                                      thumb: "100x100#" }, default_url: "/images/style/quePic.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  validates :user_id, presence: true

  validates :make, :model, :year, :enginesize, :fueltype, :cupiccapacity, 
  :bodytype, :milleage, :transmission, :platenumber, presence: true
  validates :platenumber, uniqueness: true, length: { in: 4..10}
  validates :cupiccapacity, :milleage, :enginesize, numericality: true
  validates_numericality_of :price, :greater_than => 100, :less_than => 1000000
  
  default_scope -> { order(updated_at: :desc) }

  validates :description, presence: true, 
    length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
    
  validate do
    if year && year < Date.today
    else
      errors[:year] << "Cannot be a date in the future"
    end
  end
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  # attr_accessible :framework, :name, :images_attributes
  # has_many :images, class_name: 'ProjectImage', dependent: :destroy
  # accepts_nested_attributes_for :images
end
