class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
  end

  private
  def list_params
    params.require(:user).permit(:title, :body, :profile_image)
  end
end
