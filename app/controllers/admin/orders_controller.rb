class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = Order.all_order

    case params[:status].present?
      when params[:status] == "all"
        @orders = @orders
      when params[:status] == "cancel"
        @orders = @orders.order_cancel
      when params[:status] == "pending"
        @orders = @orders.order_pending
      else
        @orders = @orders.order_delivered
    end

    @orders = @orders.page(params[:page]).per(Settings.per.limit_page)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @order = Order.find_by id: params[:id]
    @items = @order.order_details
  end

  def update
    @order = Order.find_by id: params[:id]
    @order.update_attributes order_params
  end

  private

  def order_params
    params.permit :id, :status
  end
end
