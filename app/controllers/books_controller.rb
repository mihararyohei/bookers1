class BooksController < ApplicationController
  def new
  end

  def create
    @book=Book.new(book_params)
    if @book.save
      redirect_to @book, notice:'Book was successfully updated.'
    else
      @books=Book.all
      render:index
    end
  end

  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])

  end

  def edit
    @book=Book.find(params[:id])
    @books=Book.all
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
    redirect_to @book, notice:'Book was successfully updated.'
    else
    @books=Book.all
    render:edit
    end
  end

  def destroy
    @book=Book.find(params[:id])
    if @book.destroy
    redirect_to @book, notice:'Book was successfully destroyed.'
    else
      @books=Book.all
    end
  end

  def book_params
    params.require(:book).permit(:title,:body,)
  end
end
