class BooksController < ApplicationController
  def new
    @book = Book.new(params[:id])

  end  
  def create
    @book = Book.new(params[:id])
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
  end  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
