class Shop::PostCommentsController < ApplicationController
def create
    @post = Post.find(params[:post_id])
    @post_comment = @post.post_comments.new(post_comment_params)
    @post_comment.customer_id = current_customer.id
    if @post_comment.save
      flash[:success] = "Comment was successfully created."
      redirect_to request.referer
    else
      @post_new = Post.new
      @post_comments = @post.post_comments
      render '/posts/show'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.find(params[:id])
    if @post_comment.customer == current_customer
      @post_comment.destroy
    end
    redirect_to request.referer
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:body)
  end
end