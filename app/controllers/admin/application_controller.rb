class Admin::ApplicationController < ActionController::Base
  include Admin::SessionsHelper
  def logged_in_user_admin
    unless logged_in_admin?
      flash[:danger] = t "please_login"
      redirect_to admin_path
    end
  end
end
