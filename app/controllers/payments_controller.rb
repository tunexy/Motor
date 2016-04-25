class PaymentsController < ApplicationController
  before_action :set_vehicle
  before_action :authenticate_user!
  
  def index

  end

  def show
    @user = User.find(current_user)
    #@vehicle = @user.vehicle.find(params[:id])
     
    @premium = @vehicle.cal_premium(@vehicle) + @user.cal_person_risk(@user) 
    return @premium
  end
  
  def monthly
    @premium = Vehicle.cal_premium * User.cal_person_risk
    @premium = @premium / 12
    @premium
  end
  
  def total
  end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
  
end
