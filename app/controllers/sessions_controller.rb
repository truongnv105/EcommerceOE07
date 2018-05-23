class SessionsController < ApplicationController
  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == "1" ? remember(user) : forget(user)
        flash.now[:success] = t ".success"
        respond_to do |format|
          format.html{redirect_to request.referer || root_path}
          format.js
        end
      else
        flash.now[:error] = t ".message"
        respond_to do |format|
          format.html{redirect_to request.referer || root_path}
          format.js
        end
      end
    else
      flash.now[:error] = t ".fail"
      respond_to do |format|
        format.html{redirect_to request.referer || root_path}
        format.js
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
