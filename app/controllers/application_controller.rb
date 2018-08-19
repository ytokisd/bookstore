class ApplicationController < ActionController::Base
  layout "application"

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.create!
    end
  end

end
