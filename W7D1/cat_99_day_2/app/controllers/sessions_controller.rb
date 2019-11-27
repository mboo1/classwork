class SessionsController < ApplicationController
  before_action :require_not_logged_in!, only: [:create, :new]
  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login!(user)
      redirect_to user_url(user)
    else
      redirect_to new_session_url
    end
  end

  def destroy
    self.logout!
    redirect_to new_session_url
  end
end
