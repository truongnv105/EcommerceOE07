class ProductsController < ApplicationController
  def index
    @products = Product.filter(params[:floor].to_i, params[:ceil].to_i).
      page(params[:page]).per(Settings.per.limit_page)
    if @products.blank?
      flash[:warning] = t ".not_exist"
      redirect_to root_url
    else
      message = t ".have "
      message += @products.count.to_s
      message += t ".products"

      flash[:success] = message
    end
  end

  def show; end
end
