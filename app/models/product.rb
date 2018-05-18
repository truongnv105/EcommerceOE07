class Product < ApplicationRecord
  has_many :comments
  has_many :list_categories
  has_many :orders, through: :list_categories
  has_many :ratings
  has_many :order_details
  has_many :orders, through: :order_details
end
