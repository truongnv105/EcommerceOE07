class RatingsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :load_product, only: :create

  def create
    @rating = current_user.ratings.build rating_params
    if @rating.save
      @rate = Product.find(params[:rating][:product_id]).ratings.average(:rate)
      respond_to do |format|
        format.html{redirect_to request.referer}
        format.js{flash.now[:notice] = t ".thank_you"}
      end
    else
      respond_to do |format|
        format.html{}
        format.js{flash.now[:danger] = t ".please_choice"}
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit :product_id, :rate
  end

  def load_product
    return if Product.find_by id: params[:rating][:product_id]
    flash[:danger] = t "product_not"
    redirect_to request.referer
  end
end
