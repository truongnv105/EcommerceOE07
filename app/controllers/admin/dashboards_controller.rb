class Admin::DashboardsController < Admin::ApplicationController
  before_action :logged_in_user_admin
  before_action :load_menu, only: %i(index)

  private

  def load_menu
    @categories_menu = Category.select :id, :name
  end
end
