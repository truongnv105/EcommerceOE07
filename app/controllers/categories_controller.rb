class CategoriesController < ApplicationController
  before_action :load_menu, only: :show
  def show; end

  private

  def load_menu
    @categories_menu = Category.select :id, :name
  end
end
