class UsersController < ApplicationController
  before_action :require_not_logged_in!, only: [:create, :new]

  def new
    @user = User.new 
    render :new 
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
