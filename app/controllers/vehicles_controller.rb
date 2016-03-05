class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @vehicles = Vehicle.paginate(page: params[:page], per_page: 6)
    #@vehicles = Vehicle.all.sort_by{|likes| likes.thumbs_up_total}.reverse
  end

  def show
    @posts = Post.where(vehicle_id: @vehicle.id).order("created_at DESC")
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    #@user = User.find(params[:user_id])
    #@vehicle = @user.vehicles.build
    @vehicle = current_user.vehicles.build
    10.times {@vehicle.assets.build}
  end

  def edit
    10.times {@vehicle.assets.build}
  end

  def create
     #@user = User.find(params[:id])
     #@vehicle = @user.vehicles.build(params[:vehicle])
    @vehicle = current_user.vehicles.build(vehicle_params)
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to @vehicle,
        #new_vehicle_path(:id => @user.id), 
        notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def like
    @vehicle = Vehicle.find(params[:id])
    like = Like.create(like: params[:like], user: User.first, vehicle: @vehicle)
    if like.valid?
      redirect_to :back, notice: "You like this advert "
    else
      redirect_to :back, notice: "You can only like/dislike an advert once "
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:image, :description, :make, :model, :year, :enginesize, :cupiccapacity, :price, :bodytype, :fueltype, :milleage, :transmission, :taxdue, :nctdue, :platenumber, :user_id, assets_attributes: [:id, :image])
    end
end
