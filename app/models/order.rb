class Order < ApplicationRecord
  enum status: {cancel: 0, pending: 1, delivered: 2}
  belongs_to :user
  has_many :order_details
  has_many :products, through: :order_details
  accepts_nested_attributes_for :order_details, reject_if: :all_blank
  scope :all_order, ->{select :id, :created_at, :status}
end
