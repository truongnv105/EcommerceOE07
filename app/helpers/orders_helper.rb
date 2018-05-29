module OrdersHelper
  def current_order
    @current_order ||= session[:order_id] if session[:order_id]
  end
end
