class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  scope :select_product_id, ->(order_id){where("order_id = ?", order_id).pluck(:product_id)}
end
