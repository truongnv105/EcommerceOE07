class StaticPagesController < ApplicationController
  def index
    @product_hot = Product.feature_hot.limit_num(6)
    @product_new = Product.limit_num(4)
    @product_cheap = Product.order_price.limit_num(4)
  end
end
