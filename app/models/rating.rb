class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rate, numericality: {only_integer: true}, inclusion: {in: 1..5}
end
