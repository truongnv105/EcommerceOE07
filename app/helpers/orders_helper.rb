module OrdersHelper
  def current_order
    @current_order ||= session[:order_id] if session[:order_id]
  end

  def total_cart
    @total_cart = 0;
    @total_price = 0;

    session[:order_id].each do |cart_item|
      @total_cart += cart_item["quantity"]
      @total_price += cart_item["price"].to_f * cart_item["quantity"].to_f
    end
  end

  def init_order
    if session[:order_id]
      @order = Order.new
      session[:order_id].each do |order|
        @order.order_details.build product_id: order["product_id"], quantity: order["quantity"]
      end
    end
  end
end
