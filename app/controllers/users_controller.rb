class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :load_user, except: %i(new create)

  def index; end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.create user_params

    if @user.save
      @user.send_activation_email
      respond_to do |format|
        format.html{redirect_to request.referer || root_path}
        format.js
      end
    else
      @ajax_error = @user.errors
      respond_to do |format|
        format.html{redirect_to request.referer || root_path}
        format.js
      end
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy; end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
    :password_confirmation, :phone_number, :address
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".a_sui_mess"
    redirect_to root_url
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user == current_user
  end
end
