class Admin::ProductsController < Admin::ApplicationController
  before_action :logged_in_user_admin
  before_action :load_categories, except: %i(index show destroy)
  before_action :load_product, only: %i(edit update)

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t ".add_success"
      redirect_to admin_dashboard_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update_attributes product_params
      flash[:success] = t ".update_success"
      redirect_to admin_category_path @product.category
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :describe, :price, :discount,
      :feature, :RAM, :screen, :hard_disk, :status, :category_id, images_attributes: [:id, :picture, :_destroy])
  end

  def load_categories
    @categories = Category.follow_created_at
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:warning] = t "not_found_product"
    redirect_to admin_dashboard_path
  end
end
