class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create    
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to root_url, :notice => "Signed up!"
  	else 
  		render "new"
  	end
  end

  def edit 
    @user = User.find(user_params[:user_id])
  end

  def index
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
