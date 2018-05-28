class Admin::DashboardsController < Admin::ApplicationController
  before_action :logged_in_user_admin
end
