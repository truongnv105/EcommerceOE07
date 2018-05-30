class Admin::ApplicationController < ActionController::Base
  include Admin::SessionsHelper
  layout "admin"
  before_action :load_menu

  def load_menu
    @categories_menu = Category.follow_created_at
  end

  def logged_in_user_admin
    unless logged_in_admin?
      flash[:danger] = t "please_login"
      redirect_to admin_path
    end
  end
end
