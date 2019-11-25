class UsersController < ApplicationController
  
  def index
    # render plain: "I'm in the index action!"
    users = User.all
    render json: users
  end

  def create
  user = User.new(params.require(:user).permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :forbidden
    end
  end
  
  def show
    id = params[:id]
    render json: User.find(id)
  end

  def update
    id = params[:id]
    user = User.find(id)
    user.update(params.require(:user).permit(:name, :email))
    render json: user
  end

  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    render json: index
  end
end