class Admin::UsersController < Admin::ApplicationController
  before_action :logged_in_user_admin
  before_action :load_menu, only: %i(index)

  def index
    search = params[:user_search]
    @users = User.user_activated.page(params[:page]).per(Settings.per.limit_page)
    @users = User.user_activated.name_like(search).page(params[:page]).per(Settings.per.limit_page) unless search.blank?
  end

  def destroy
    user = User.find_by(id: params[:id])
    if !user.nil?
      user.destroy
    end
    redirect_to request.referer
  end

  private

  def load_menu
    @categories_menu = Category.select :id, :name
  end
end
