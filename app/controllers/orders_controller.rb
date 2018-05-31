class OrdersController < ApplicationController
  before_action :logged_in_user, only: %i(create update)

  def index
    @orders = current_user.orders.all_order
  end

  def show
    @order = Order.find_by id: params[:id]
    @items = @order.order_details
  end

  def create
    @order = current_user.orders.build order_params

    if @order.save
      flash[:success] = t ".success"
      session.delete :order_id
      @current_order = nil
      redirect_to root_url
    end
  end

  def update
    @order = Order.find_by id: params[:id]

    if @order.update_attributes order_params
      flash[:sucess] = t ".cancel_success"
      redirect_to orders_url
    end
  end

  private

  def order_params
    params.require(:order).permit(:status,
      order_details_attributes: [:id, :product_id, :quantity, :_destroy])
  end
end
