class ApplicationController < ActionController::Base
  layout "application"

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.create!
    end
  end

  protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path
    end
  end
end
