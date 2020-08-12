class Shop::PostsController < ApplicationController
  before_action :authenticate_shop!, except: [:all_index, :show, :list]

  def all_index
    @posts = Post.page(params[:page]).reverse_order.per(9)
  end

  def show
    @post = Post.find(params[:id])
    @shop = Shop.find(params[:shop_id])
  end

  def list
    @shop = Shop.find(params[:id])
    @posts = @shop.posts.page(params[:page]).reverse_order.per(9)
  end

  def index
  	@posts = current_shop.posts.page(params[:page]).reverse_order.per(4)
  end

  def new
  	@post = Post.new
  end

	def create
		@post = Post.new(post_params)
  	@post.shop_id = current_shop.id
  	@post.save
  	redirect_to shop_posts_path
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
    redirect_to shop_posts_path
  end

  private
  def post_params
  	params.require(:post).permit(:body, :post_image)
  end
end
