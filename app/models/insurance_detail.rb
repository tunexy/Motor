class InsuranceDetail < ActiveRecord::Base
  belongs_to :user
  #belongs_to :worker, :class_name => 'User', :foreign_key => 'user_id'
  
  validates :user_id, presence: true
  
  def license_held
    if licenseheld <= 1
      @held = 2.4
    elsif
      licenseheld <= 2
      @held = 2
    elsif
      licenseheld <= 3
      @held = 1.6
    elsif
      licenseheld <= 4
      @held = 1.3
    elsif
      licenseheld <= 5
      @held = 1.1
    else
      @held = 0.5
    end
    @held
  end
  
  def free_claim_bonus
    if freeclaim <= 1
      @bonus = 0.8
    elsif
      licenseheld <= 2
      @bonus = 0.65
    elsif
      licenseheld <= 3
      @bonus = 0.42
    elsif
      licenseheld <= 4
      @bonus = 0.24
    elsif
      licenseheld <= 5
      @bonus = 0.18
    else
      @bonus = 0.11
    end
    @bonus
  end
  
  
  def penalty
    if penaltypoint <= 2
      @held = 4.4
    elsif
      penaltypoint <= 4
      @held = 7
    elsif
      penaltypoint <= 6
      @held = 9.6
    elsif
      penaltypoint <= 8
      @held = 11.4
    elsif
      penaltypoint <= 10
      @held = 15
    elsif
      penaltypoint <= 12
      @held = 18
    else
      @held = 0.3
    end
    @held
  end
  
  def driving_exp
    if yearsdriving <= 2
      @exp = 1.4
    elsif
      yearsdriving <= 4
      @exp = 1.1
    elsif
      yearsdriving <= 6
      @exp = 0.7
    elsif
      yearsdriving <= 8
      @exp = 0.4
    elsif
      yearsdriving <= 10
      @exp = 0.15
    else
      @exp = 0.11
    end
    @exp
  end
  
  def recent_claim
    recentclaim.blank? ? 0.8 : 3.5
  end
  
  def home_owner
    homeowner.blank? ? 1.6 : 0.5
  end
  
  def cal_insurance_risk
    @insurance = home_owner * recent_claim * driving_exp * penalty * free_claim_bonus * license_held 
    @insurance
  end
  
end
