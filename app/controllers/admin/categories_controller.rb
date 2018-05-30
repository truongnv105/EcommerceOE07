class Admin::CategoriesController < Admin::ApplicationController
  before_action :logged_in_user_admin
  before_action :load_category, only: %i(show edit update)

  def index
    @categories = Category.follow_created_at
  end

  def show
    @products = @category.products.name_like(params[:product_search]).page(params[:page]).per Settings.per.limit_page
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".add_success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".update_success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
      flash[:warning] = t "not_found_cate"
      redirect_to admin_categories_path
  end
end
