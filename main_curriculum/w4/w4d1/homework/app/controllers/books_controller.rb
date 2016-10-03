class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    render :new
  end

  def create
    new_book = Book.new(book_params)
    if new_book.save
      redirect_to "/books"
    else
      flash.now[:errors] = book.errors.full_messages
      render :new
    end
  end

  def destroy
    wanted_book_id = params[:id]
    Book.delete(wanted_book_id)
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
