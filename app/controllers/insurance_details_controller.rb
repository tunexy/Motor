class InsuranceDetailsController < ApplicationController
  before_action :set_insurance_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @insurance_details = InsuranceDetail.all
  end

  def show
  end

  def new
    @insurance_detail = current_user.build_insurance_detail
  end
  
  def edit
  end

  def create
    @insurance_detail = current_user.build_insurance_detail(insurance_detail_params)
    @insurance_detail = current_user
    
    respond_to do |format|
      if @insurance_detail.save
        format.html { redirect_to @insurance_detail, notice: 'Insurance detail was successfully created.' }
        format.json { render :show, status: :created, location: @insurance_detail }
      else
        format.html { render :new }
        format.json { render json: @insurance_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      #@insurance_detail = Insurance_detail.find(params[:id])
      if @insurance_detail.update(insurance_detail_params)
        format.html { redirect_to @insurance_detail, notice: 'Insurance detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @insurance_detail }
      else
        format.html { render :edit }
        format.json { render json: @insurance_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @insurance_detail.destroy
    respond_to do |format|
      format.html { redirect_to insurance_details_url, notice: 'Insurance detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_detail
      @insurance_detail = InsuranceDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insurance_detail_params
      params.require(:insurance_detail).permit(:licensenumber, :licenseheld, :penaltypoint, :dateofpenalty, :freeclaim, :recentclaim, :claimdate, :yearsdriving, :packing, :homeowner, :kmperyear, :user_id)
    end
end
