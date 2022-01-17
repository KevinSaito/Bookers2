class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if@book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books =Book.all
    @book = Book.new(params[:id])

  end

  def show
    @book = Book.find(params[:id])
    @book.user_id = book_params(@book.id)
    @books = Book.all
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
end
