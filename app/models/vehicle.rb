class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :assets
  has_many :posts, dependent: :delete_all
  
  accepts_nested_attributes_for :assets, allow_destroy: true
  
  has_attached_file :image, styles: { large: "450x450>", medium: "350x300>", 
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
  
  
    

  def make_level
    if make == 'Audi' || make == 'BMW'
     @risk = 60
    elsif
      make == 'Opel' || make == 'Honda' || make == 'Nissa'
      @risk = 40
    else
      @risk = 20
    end
    @risk
  end
    
  def car_old
    if year <= 5.years.ago
      @tear = 0.30
    elsif
      year <= 10.years.ago
      @tear = 0.50
    elsif
      year <= 20.years.ago
      @tear = 0.80
    else
      @tear = 1.50
    end
    @tear
  end
  
  def car_engine
    if enginesize <= 1.0
      @wear = 4
    elsif
      enginesize <= 1.4
      @wear = 6
    elsif
      enginesize <= 1.8
      @wear = 8
    elsif
      enginesize <= 2.4
      @wear = 10
    elsif
      enginesize <= 2.8
      @wear = 12
    elsif
      enginesize <= 3.2
      @wear = 15
    elsif
      enginesize <= 4.0
      @wear = 18
    else
      @wear = 20
    end
    @wear
  end
  
  def check_price
    if price <= 5000
      @theprice = price / 100 * 10
    elsif
      price <= 10000
      @theprice = price / 100 * 25
    elsif
      price <= 20000
      @theprice = price / 100 * 40
    elsif
      price <= 50000
      @theprice = price / 100 * 60
    else
      @theprice = price / 100 * 90
    end
    @theprice
  end
  
  def cal_premium(vehicle)
    @vehicle=vehicle
    @prem = @vehicle.make_level * @vehicle.car_old * @vehicle.car_engine * @vehicle.check_price / 100
    @prem
  end
  
  

  # attr_accessible :framework, :name, :images_attributes
  # has_many :images, class_name: 'ProjectImage', dependent: :destroy
  # accepts_nested_attributes_for :images
end
