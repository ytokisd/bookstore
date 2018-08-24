class CartsController < ApplicationController

  def show
    @order_items = current_order.books_orders
  end

  def attach_user
    @order = current_order
    @order.update_attributes(:user_id => current_user.id)
  end
end
