class CouponsController < ApplicationController
  def index
    code = params[:code]
    #id = current_order.id
    @coupon = Coupon.find_by_code(code)
    @order = current_order
    if @coupon && @coupon.active
      @order.update_attributes(:coupon_id => @coupon.id)
      @coupon.update_attributes(:active => false)
      redirect_to order_path(@order)
    else
      redirect_to order_path(@order)
    end
  end

  def coupon_params
    params.require(:coupon).permit(:code)
  end
end




#@order = current_order
#@order.update_attributes(:user_id => current_user.id)
#redirect_to order_path(@order)
