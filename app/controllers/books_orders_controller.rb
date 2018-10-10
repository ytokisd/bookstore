class BooksOrdersController < ApplicationController

  def create
    @order = current_order
    @item = @order.books_orders.create!({:book_id => params[:book_id].to_i, :order_id => @order.id, :quantity => params[:quantity].to_i})
    session[:order_id] = @order.id
    redirect_to books_path
#    @order = current_order
#    @item = @order.books_orders.create(params['book_id'.to_i, 'order_id'.to_i, 'quantity'.to_i])
#    @order.save
#    session[:order_id] = @order.id
#    redirect_to books_path
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
    params.permit! #(:quantity, :book_id)
  end
end
