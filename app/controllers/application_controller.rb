class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform this action"
      redirect_to :back
    end
  end

  protected

    def configure_permitted_parameters
            devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
            
            devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :avatar, :email, 
            :password, :current_password, :firstname, :lastname, :martialstatus, :employmentstatus, 
            :phonenumber, :address, :city, :is_female, :dateofbirth, :latitude, :longitude) }
    end
end
