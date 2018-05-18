class Category < ApplicationRecord
  has_many :list_categories
  has_many :products, through: :list_categories
end
