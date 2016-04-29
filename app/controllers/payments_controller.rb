class PaymentsController < ApplicationController
  before_action :set_vehicle
  before_action :authenticate_user!

  def index

  end

  def show
    @user = User.find(current_user)
    @premium = @vehicle.cal_premium(@vehicle) + @user.cal_person_risk(@user) * @user.insurance_detail.cal_insurance_risk
    
    @prem = @premium * 88 / 100
    
    @install = @premium * 1.6
    
    @fully = @premium * 11

  end
  
  def show_third
    @thethird = @premium * 93 / 100
  end
  
  def show_third_theft
    @user = User.find(current_user)
    @theft = @vehicle.cal_premium(@vehicle) + @user.cal_person_risk(@user) * @user.insurance_detail.cal_insurance_risk
    
    @thirdtheft = @theft * 85 / 100
  end
  
  
  
  def show_fully
    @user = User.find(current_user)
    @premium = @vehicle.cal_premium(@vehicle) + @user.cal_person_risk(@user) * @user.insurance_detail.cal_insurance_risk
    
    @fully = @premium * 10
  end
  
  def show_install
    @user = User.find(current_user)
    @premium = @vehicle.cal_premium(@vehicle) + @user.cal_person_risk(@user) * @user.insurance_detail.cal_insurance_risk
    
    @prem = @premium * 1.5
  end

  
  
  def total
  end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
    
end
