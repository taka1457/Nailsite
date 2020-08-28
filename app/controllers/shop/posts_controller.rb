class Shop::PostsController < ApplicationController
  before_action :authenticate_shop!, except: [:all_index, :rank, :show, :list]
  before_action :ensure_post, only: [:edit, :update, :destroy]

  def all_index
    @posts = Post.page(params[:page]).reverse_order.per(9)
  end

  def rank
    @posts = Post.where(id: Favorite.group(:post_id).order('count(post_id) desc').pluck(:post_id)).page(params[:page]).per(9)
  end

  def show
    @post = Post.find(params[:id])
    @shop = Shop.find(params[:shop_id])
    @post_comment = PostComment.new
    @post_comments = @post.post_comments
  end

  def list
    @shop = Shop.find(params[:id])
    @posts = @shop.posts.page(params[:page]).reverse_order.per(9)
  end

  def index
    @posts = current_shop.posts.page(params[:page]).reverse_order.per(9)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.shop_id = current_shop.id
    if @post.save
      redirect_to shop_posts_path
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to request.referer
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to shop_posts_path
    else
      render :edit
    end
  end

  private

  def ensure_post
    @posts = current_shop.posts
    @post = @posts.find_by(id: params[:id])
    unless @post
      redirect_to shop_posts_path(current_shop)
    end
  end

  def post_params
    params.require(:post).permit(:body, :post_image)
  end
end
