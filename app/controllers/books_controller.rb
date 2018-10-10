class BooksController < ApplicationController
  respond_to :html, :js, only: [:index]
  def index
    @order = current_order
    @books = Book.all
    @books_by_category = ActiveRecord::Base.connection.execute("SELECT c.id, c.name, COUNT(b_c.book_id) FROM categories c LEFT JOIN books_categories b_c ON c.id = b_c.category_id LEFT JOIN books b ON b_c.book_id = b.id WHERE b.name is not null GROUP BY c.id").to_a
    @books = other_books if params[:category].present?
#    if params[:category_id].blank?
#      @books = Book.all
#    else
#      @category_id = Category.find_by(id: params[:category_id])
#      @books = @category_id.books
#    end
   @categories = Category.all
   @books_orders = current_order.books_orders.new
   @books = @books.sort_by {|book| book.price} if params[:filter] == 'price_from_low'
   @books = @books.sort_by {|book| book.price}.reverse if params[:filter] == 'price_from_high'
   @books = @books.sort_by {|book| book.created_at} if params[:filter] == 'newest'
   @books = Book.where(id: @books.map(&:id)).find_by_sql("SELECT b.*, SUM(b_o.quantity) AS quantity FROM books b LEFT JOIN books_orders b_o ON b.id = b_o.book_id JOIN books_categories b_c ON b.id = b_c.book_id #{"WHERE b_c.category_id = #{params[:category]}" if params[:category]} GROUP BY b.id ORDER BY quantity DESC") if params[:filter] == 'popular_first'
   @books_array = Kaminari.paginate_array(@books).page(params[:page]).per(1)
   respond_with @books_array

   #@books_by_sales = Category.joins( books: :books_orders).group('books_orders.book_id').sum('books_orders.quantity').sort_by {|_key, value| value}.reverse.to_h
  end

  def show
    @book = Book.find(params[:id])
    @books_orders = current_order.books_orders.new
  end

  def book_params
    params_require(:book).permit(:name, :description, :image)
  end

  def other_books
    books = []
    @books.each do |book|
      if book.category_ids.first == params[:category].to_i
        books.push(book)
      end
    end
    books
  end

  def add_to_cart
    ordered_book = current_order.books_orders.new(:book_id => params[:id].to_i, :order_id => current_order.id, :quantity => 1)
    ordered_book.save
  end

end
