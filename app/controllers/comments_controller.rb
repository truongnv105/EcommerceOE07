class CommentsController < ApplicationController
  before_action :logged_in_user

  def create
    load_product
    @comment = @product.comments.build comment_params
    @comment.parent_id = params[:parent_id]
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to @comment.product
          flash[:success] = t ".success"
        end
        format.js
      else
      end
    end
  end

  def edit
    load_comment
    @product = @comment.product

    respond_to do |format|
      format.js
    end
  end

  def update
    load_comment
    @product = @comment.product

    respond_to do |format|
      if @comment.update_attributes comment_params
        format.html {@comment.product}
        format.js
      end
    end
  end

  def destroy
    load_comment

    if @comment.destroy
      respond_to do |format|
        format.js
      end
    end
  end


  private

  def comment_params
    params.require(:comment).permit :parent_id, :product_id, :content, :picture
  end

  def load_product
    @product = Product.find_by id: params[:product_id]

    if @product.nil?
      flash[:danger] = t "product_not_exist"
      redirect_to root_url
    end
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]

    if @comment.nil?
      redirect_to request.referer
      flash.now[:danger] = t "comment_not_exist"
    end
  end
end
