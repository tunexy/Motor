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
    if make == 'Audi' || make == 'BMW' || make == 'Cadillac' || make == 'Volvo' || make == 'Jaguar' || make == 'Aston Martin' || make == 'Bentley' || make == 'Ferrari'
     @risk = 10
    elsif
      make == 'Alfa Romeo' || make == 'Jeep' || make == 'Mercedes Benz' || make == 'Subaru' || make == 'Land Rover' || make == 'Toyota' || make == 'Chevrolet'
      @risk = 7
    elsif
      make == 'Volkswagen' || make == 'Acura' || make == 'Peugeot' || make == 'Honda' || make == 'Hyundai'
     @risk = 5
     elsif 
      make == 'Opel' || make == 'Renault' || make == 'Nissa' || make == 'Ford' || make == 'Saab'
      @risk = 2.5
    else
      @risk = 3
    end
    @risk
  end
    
  def car_old
    @tear = Date.today.year - year.to_date.year
    if @tear <= 5
      @v = 1.3
    elsif @tear <= 10
      @v = 1.8
    elsif @tear <= 20
      @v = 4
    else
      @v = 2
    end
    @v
  end
    
  
  def car_engine
    if enginesize <= 1.0
      @wear = 1.3
    elsif
      enginesize <= 1.4
      @wear = 1.6
    elsif
      enginesize <= 1.8
      @wear = 1.8
    elsif
      enginesize <= 2.4
      @wear = 2
    elsif
      enginesize <= 2.8
      @wear = 2.4
    elsif
      enginesize <= 3.2
      @wear = 3.2
    elsif
      enginesize <= 4.0
      @wear = 5
    else
      @wear = 9
    end
    @wear
  end
  
  def check_price
    if price <= 1000
      @theprice = price / 70
    elsif
      price <= 5000
      @theprice = price / 90
    elsif
      price <= 10000
      @theprice = price / 110
    elsif
      price <= 20000
      @theprice = price / 130 
    elsif
      price <= 30000
      @theprice = price / 150 
    elsif
      price <= 50000
      @theprice = price / 180
      elsif
      price <= 100000
      @theprice = price / 200
      elsif
      price <= 1000000
      @theprice = price / 500
      elsif
      price <= 5000000
      @theprice = price / 1000
    else
      @theprice = price / 100 
    end
    @theprice
  end
  
  def cal_premium(vehicle)
    @vehicle = vehicle
    @prem = @vehicle.make_level * @vehicle.car_old * @vehicle.car_engine * @vehicle.check_price / 100
    @prem 
  end

end
