class CartsController < ApplicationController

  def show
    @order_items = current_order.books_orders
  end
end
