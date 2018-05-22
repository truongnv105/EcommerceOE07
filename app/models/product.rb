class Product < ApplicationRecord
  has_many :comments
  has_many :list_categories
  has_many :orders, through: :list_categories
  has_many :ratings
  has_many :order_details
  has_many :orders, through: :order_details
  scope :feature_hot, -> {where feature: true }
  scope :order_create_at, -> {order(created_at: :DESC)}
  scope :limit_num, -> (num){limit num}
  scope :order_price, -> {order :price}
end
