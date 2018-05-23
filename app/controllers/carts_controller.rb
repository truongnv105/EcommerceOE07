class CartsController < ApplicationController
  before_action :load_product, only: :create

  def create
    unless session[:order_id].present?
      session[:order_id] = []
    end

    item = Cart.new(@product.id, @product.name, @product.price,
      @product.picture, Settings.order_details.quantity.default)

    index = session[:order_id].find_index {|n| n["product_id"] == item.product_id}

    if index.nil?
      session[:order_id] << item
    else
      quantity = session[:order_id][index]["quantity"]
      session[:order_id][index]["quantity"] = quantity+1
    end

    @current_order = session[:order_id]

    respond_to do |format|
      format.html {redirect_to root_url}
      format.js
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:product_id]
    redirect_to root unless @product
  end
end
