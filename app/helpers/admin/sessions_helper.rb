module Admin::SessionsHelper
  def log_in_admin user
    session[:admin_id] = user.id
  end

  def current_user_admin
    if user_id = session[:admin_id]
      @current_user_admin ||= User.find_by id: user_id
    end
  end

  def logged_in_admin?
    !current_user_admin.nil?
  end

  def log_out_admin
    session.delete :admin_id
    @current_user_admin = nil
  end
end
