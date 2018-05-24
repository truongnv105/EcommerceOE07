class Admin::DashboardsController < Admin::ApplicationController
  layout "admin"
  before_action :logged_in_user_admin
end
