class Cart
  attr_accessor :product_id, :name, :price, :picture, :quantity

  def initialize product_id, name, price, picture, quantity
    @product_id = product_id
    @price = price
    @image = picture
    @name = name
    @quantity = quantity
  end
end
