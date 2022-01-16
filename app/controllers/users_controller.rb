class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def edit
    @user = User.find(params[:id])
    
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path(@user.id)
  end

  private
  def list_params
    params.require(:user).permit(:title, :body, :profile_image)
  end
end
