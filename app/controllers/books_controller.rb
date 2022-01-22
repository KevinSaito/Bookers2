class BooksController < ApplicationController
  before_action :baria_user, only: [:edit, :destroy, :update]
  before_action :authenticate_user!
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@book)
    else
      @books =Book.all
      @newbook = Book.new
      @user = current_user
      render:index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user = current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def index
    @books =Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:alert] = "Book was successfully destroyed."
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def baria_user
    unless Book.find(params[:id]).user == current_user
        redirect_to books_path
    end
  end
end
