class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :vehicles
  has_many :likes
  has_many :posts, dependent: :destroy
  has_one :insurance_detail, dependent: :destroy
  has_many :sent_invites, class_name: "Relationship", foreign_key: :inviting_id
  has_many :received_invites, class_name: "Relationship", foreign_key: :invited_id
  
  has_many :invited_users, through: :sent_invites, source: :invited_user
  has_many :inviting_users, through: :received_invites, source: :inviting_user
  
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
                                    
  has_attached_file :avatar, styles: { large: "700x600>", medium: "300x300>", thumb: "100x100#" }, 
  default_url: "/images/medium/download.jpeg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
  #geocoded_by :address 
  #after_validation :geocoder, :if => :address_changed?
  #validates :username, :firstname, :lastname, :dateofbirth, :martialstatus,
  #:phonenumber, :address, :city, presence: true
  #validates :username, uniqueness: true, length: { in: 3..20}
  
  #validates :firstname, :lastname, 
  #  length: { in: 2..20, too_long: "%{count} characters is the maximum allowed" }
    
  #validate do
   #  if dateofbirth && dateofbirth < Date.today
   # else
   #    errors[:dateofbirth] << "Date Of Birth  Can not be a date in the future"
   #  end
  #end
  
  acts_as_messageable

  def mailboxer_username
   self.username
  end

  def mailboxer_email(object)
   self.email
  end
  
  def user_name
    username.blank? ? email : username
  end
  
  def employed
    employmentstatus.blank? ? 5 : 2
  end
  
  def family_status
    if martialstatus == 'Single'
      @family = 4
    elsif
      martialstatus == 'Married'
      @family = 1.2
    elsif
      martialstatus == 'Divorced'
      @family = 1.8
    else
      @family = 1.5
    end
    @family
  end
  
  def user_age
    @var = Date.today.year - dateofbirth.to_date.year
    if @var < 24
      @v = 6
    elsif @var <= 35
      @v = 2
    elsif @var <= 45
      @v = 1.6
    elsif @var <= 55
      @v = 1.2
    elsif @var <= 70
      @v = 1
    else
      @v = 1.5
    end
      @v
  end
  
  def user_sex
    is_female.blank? ? 5 : 2
  end
  
  def cal_person_risk(user)
    @user = user
    @user_risk = @user.user_age * @user.user_sex * @user.family_status
    @user_risk
  end
  
end
