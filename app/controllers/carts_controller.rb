class CartsController < ApplicationController
  before_action :load_product, only: :create
  before_action :load_menu, only: :index

  def index
    if session[:order_id]
      current_order
      total_cart
      init_order
    end
  end

  def create
    unless session[:order_id].present?
      session[:order_id] = []
    end

    item = Cart.new(@product.id, @product.name, @product.price,
      @product.images.first.picture, Settings.order_details.quantity.default)

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

  def update
    session[:order_id].each do |item|
      if item["product_id"] == params[:id].to_i
        item["quantity"] = params["quantity"].to_i
        @sub_price = item["quantity"].to_i * item["price"].to_f
      end
    end
    total_cart
    init_order

    respond_to do |format|
      format.js
    end
  end

  def destroy
    session[:order_id].delete_if{|item| item["product_id"] == params[:id].to_i}
    total_cart
    init_order

    respond_to do |format|
      format.js
    end
  end

  private

  def load_product
    @product = Product.find_by id: params[:product_id]
    redirect_to root unless @product
  end

  def load_menu
    @categories_menu = Category.select :id, :name
  end
end
