class UsersController < ApplicationController
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

  def show
    @user = User.find_by id: params[:id]

    if @user.nil?
      redirect_to root_url
    end
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation, :phone_number, :address
  end

end
