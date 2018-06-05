class StaticPagesController < ApplicationController
  def index
    @supports = Supports::ProductSupport.new
  end
end
