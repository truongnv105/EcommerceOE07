class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def logged_in_user
    unless logged_in?
      flash[:danger] = t ".please_log_in"
      redirect_to root_url
    end
  end
end
