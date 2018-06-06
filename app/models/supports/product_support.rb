class Supports::ProductSupport
  def hot_products
    @hot_products = Product.feature_hot.limit_num(6)
  end

  def new_products
    @new_products = Product.order_created.limit_num(4)
  end

  def cheap_products
    @cheap_products = Product.order_price.limit_num(4)
  end
end
