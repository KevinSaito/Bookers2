class BooksController < ApplicationController
  before_action :baria_user, only: [:edit, :destroy, :update]
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    if@book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully"
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
  end

  def index
    @books =Book.all
    @newbook = Book.new
    @infouser = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path
      flash[:notice] = "You have updated book successfully."
    else
      render :show
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
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
