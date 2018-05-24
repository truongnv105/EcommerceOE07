class Admin::SessionsController < Admin::ApplicationController
  layout "admin"
  include Admin::SessionsHelper
  before_action :before_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      if user.activated? && user.is_admin?
        log_in_admin user
        redirect_to admin_dashboard_path
      else
        flash.now[:danger] = t "hack_page"
        render "new"
      end
    else
      flash.now[:danger] = t "invalid_login"
      render "new"
    end
  end

  def destroy
    log_out_admin if logged_in_admin?
    redirect_to admin_path
  end

  def before_login
    redirect_to admin_dashboard_path unless !logged_in_admin?
  end
end
