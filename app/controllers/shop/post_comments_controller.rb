class Shop::PostCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @post = Post.find(params[:post_id])
    @shop = Shop.find(params[:shop_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.customer_id = current_customer.id
    if @post_comment.save
      flash[:success] = "Comment was successfully created."
    else
      @post_new = Post.new
      @post_comments = @post.post_comments
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @shop = Shop.find(params[:shop_id])
    @post_comment = PostComment.find(params[:id])
    if @post_comment.customer == current_customer
      @post_comment.destroy
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body)
  end
end