class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :vehicles
  has_many :posts, dependent: :delete_all
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
                                    
  has_attached_file :avatar, styles: { large: "700x600>", medium: "300x300>", thumb: "100x100#" }, 
  default_url: "/images/:style/download.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  validates :username, :firstname, :lastname, :dateofbirth, :martialstatus,
  :phonenumber, :address, :city, presence: true
  
  validates :username, uniqueness: true, length: { in: 3..20}
  
  validates :firstname, :lastname, 
    length: { in: 2..20, too_long: "%{count} characters is the maximum allowed" }
    
  validate do
    if dateofbirth && dateofbirth < Date.today
    else
      errors[:dateofbirth] << "Date Of Birth  Can not be a date in the future"
    end
  end
end
