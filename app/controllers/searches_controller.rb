class SearchesController < ApplicationController
  def new
    @search = Search.new
  end
  
  def create
    @search = Search.create(search_params)
    redirect_to @search
  end
  
  def show
    @search = Search.find(params[:id])
  end
  
  
  private
  
  def search_params
    params.require(:search).permit(:make, :model, :fueltype, :bodytype, :transmission, :min_price, :max_price, :min_year, :max_year)
  end
end
