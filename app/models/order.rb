class Order < ApplicationRecord
  enum status: {cancel: 0, pending: 1, delivered: 2}
  belongs_to :user
  has_many :order_details
  has_many :products, through: :order_details
  accepts_nested_attributes_for :order_details, reject_if: :all_blank

  scope :all_order, ->{select :id, :user_id, :created_at, :status}
  scope :order_cancel, ->{where status: :cancel}
  scope :order_pending, ->{where status: :pending}
  scope :order_delivered, ->{where status: :delivered}

  scope :filter_by_status, lambda{ |filter_params|
    case filter_params[:status].presents?
      when filter_params[:status] == "cancel"
        Order.where("status = ?", filter_params[:status])
      when filter_params[:status] == "pending"
        Order.where("status = ?", filter_params[:status])
      when filter_params[:status] == "delivered"
        Order.where("status = ?", filter_params[:status])
    end
  }
end
