class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    if@book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end
  
  def index
  
  end
end
