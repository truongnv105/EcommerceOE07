class ProductsController < ApplicationController
  def show
    @product = Product.find_by id: params[:id]

    if @product.nil?
      flash[:danger] = "Product not exist in database"
      redirect_to root_url
    else
      @comment = Comment.new
      @comments = @product.comments.comment_root
    end
  end

  private

  def product_params
    params.require(:product).permit :comment_id, :name
  end
end
