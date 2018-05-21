class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :orders
  has_many :ratings
end
