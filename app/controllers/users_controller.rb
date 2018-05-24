class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :load_user

  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".check_email"
      redirect_to root_url
    else
      flash.now[:danger] = t ".failure"
      render :new
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :phone_number, :address
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = "<a-suitable-message-here>"
    redirect_to root_url
  end
end
