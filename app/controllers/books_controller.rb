class BooksController < ApplicationController
  def index
    if params[:category_id].blank?
      @books = Book.all
    else
      @category_id = Category.find_by(id: params[:category_id])
      @books = @category_id.books
    end
    @categories = Category
  end

  def show
    @book = Book.find(params[:id])
  end

  def book_params
    params_require(:book).permit(:name, :description, :image)
  end
end
