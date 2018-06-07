class ProductsController < ApplicationController
  before_action :load_menu, only: [:index, :show]
  before_action :load_product, only: :show

  def index
    if params[:product_search].present?
      @products = Product.name_like(params[:product_search]).page(params[:page]).
      per Settings.per.product.limit_page
    else
      @products = Product.filter(params[:floor].to_i, params[:ceil].to_i).
        page(params[:page]).per(Settings.per.limit_page)
    end
    return if @products.present?
    flash[:warning] = t ".not_exist"
    redirect_to root_url
  end

  def show
    @rate = @product.ratings.average(:rate)
  end

  private

  def load_menu
    @categories_menu = Category.select :id, :name
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:warning] = t "product_not"
    redirect_to root_path
  end
end
