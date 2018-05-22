class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]

    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      flash[:success] = t ".activated"
      redirect_to user
    else
      flash[:danger] = t ".inactivate"
      redirect_to root_url
    end
  end
end
