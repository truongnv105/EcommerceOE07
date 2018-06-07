class CategoriesController < ApplicationController
  before_action :load_menu, only: :show

  def show
    @products = Product.filter_by_category(filter_params).
      page(params[:page]).per(Settings.per.limit_filter)

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def filter_params
    params.permit :id, :ram, :hard_disk, :sort
  end

  def load_menu
    @categories_menu = Category.select :id, :name
  end
end
