class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_books = @order.books_orders
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(project_params)
    respond_to do |format|
      format.html {redirect_to orders_path}
      format.js
    end
    #code = params[:code]
    #coupon = Coupon.find_by_code(code)
    #if coupon.code == code && coupon.active == true
      #current_order.update_attribute(order_params)
      #coupon.update_attribute(coupon.active, false)
      #current_order.update
    #end
  end

  def project_params
    params.require(:order).permit(:coupon_id)
  end
end
