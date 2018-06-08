class Admin::DashboardsController < Admin::ApplicationController
  before_action :logged_in_user_admin
  before_action :load_menu, only: %i(index)

  def index
    @users = User.all
    @products = Product.all
    @order_details = OrderDetail.all
    @orders = Order.all
    @comments = Comment.all
    @ratings = Rating.all
  end

  private

  def load_menu
    @categories_menu = Category.select :id, :name
end
