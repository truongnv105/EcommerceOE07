class CommentsController < ApplicationController
  before_action :load_product, only: %i(create edit update)

  def create
    @comment = @product.comments.build comment_params
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html{redirect_to product_path params[:product_id]}
        format.js
      end
    else
      respond_to do |format|
        format.html{redirect_to product_path params[:product_id]}
        format.js
      end
    end
  end

  def edit
    @comment = @product.comments.find_by id: params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @comment = @product.comments.find_by id: params[:id]
    if @comment.update_attributes comment_params
      flash.now[:notice] = "update success"
      respond_to do |format|
        format.html{redirect_to product_path params[:product_id]}
        format.js
      end
    else
      respond_to do |format|
        format.html{redirect_to product_path params[:product_id]}
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment
      @comment.destroy
      respond_to do |format|
        format.html {redirect_to request.referrer || root_url}
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def load_product
    @product = Product.find_by id: params[:product_id]
  end
end
