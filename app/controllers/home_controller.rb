class HomeController < ApplicationController
  def index
    #comment
    @books = Book.all
    @new_books = @books.order(created_at: :desc).limit(3)
  end
end
