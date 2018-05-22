class StaticPagesController < ApplicationController
  def index
    @product_hot = Product.feature_hot.order_create_at.limit_num(6)
    @product_new = Product.order_create_at.limit_num(4)
    @product_cheap = Product.order_price.limit_num(4)
  end
end
