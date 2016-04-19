class PageController < ApplicationController
  def home
    if !user_signed_in?
      @vehicles = Vehicle.paginate(page: params[:page], per_page: 12)
    else
      redirect_to vehicles_path
    end
  end

  def about
  end

  def faqs
  end

  def contact
  end
end
