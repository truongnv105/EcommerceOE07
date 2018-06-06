class StaticPagesController < ApplicationController
  before_action :load_menu, only: :index

  def index
    @supports = Supports::ProductSupport.new
  end

  private

  def load_menu
    @categories_menu = Category.select :id, :name
  end
end
