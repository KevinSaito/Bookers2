class UsersController < ApplicationController

  def show
  end

  def index
  end

  def edit
    @user = User.find(params[:id])
    @post_images = @user.post_images  
  end

  def update
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
