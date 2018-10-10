class HomeController < ApplicationController
  def index
    #comment
    @books = Book.all
    @new_books = @books.order(created_at: :desc).limit(3)
#    @books_orders = BooksOrder.select(:book_id.distinct, :quantity)
    @books_by_sales = Category.joins( books: :books_orders).group('books_orders.book_id').sum('books_orders.quantity').sort_by {|_key, value| value}.reverse.to_h
    @categories = Category.all
  end

end
