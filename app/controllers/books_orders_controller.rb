class BooksOrdersController < ApplicationController

  def create
    @order = current_order
    @item = @order.books_orders.create!(item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to books_path
  end

  def destroy
    @order = current_order
    @item = @order.books_orders.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

  def item_params
    params.require(:books_order).permit! #(:quantity, :book_id)
  end
end
