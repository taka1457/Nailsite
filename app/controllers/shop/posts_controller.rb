class Shop::PostsController < ApplicationController
def index
  	@posts = Post.page(params[:page])
  end

  def new
  	@post = Post.new
  end

	def create
		@post = Post.new(post_params)
  	@post.shop_id = current_shop.id
  	@post.save
  	redirect_to posts_path
  end
  def destroy
  	@post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	post = Post.find(params[:id])
    post.update(post_params)
    redirect_to posts_path
  end

  private
  def post_params
  	params.require(:post).permit(:body, :post_image)
  end
end
