class UsersController < ApplicationController
  
  def index
    @users = User.paginate(page: params[:page], per_page: 1)
    
    @sent_invites = current_user.sent_invites.page(params[:page])
    @received_invites = current_user.received_invites.page(params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
