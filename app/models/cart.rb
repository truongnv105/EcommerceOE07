class Cart
  attr_accessor :product_id, :name, :price, :picture, :quantity

  def initialize product_id, name, price, picture, quantity
    @product_id = product_id
    @name = name
    @price = price
    @picture = picture
    @quantity = quantity
  end
end
