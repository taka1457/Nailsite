class Shop::PostsController < ApplicationController
  before_action :authenticate_shop!, except: [:all_index, :rank, :show, :list]
  before_action :ensure_post, only: [:edit, :update, :destroy]

  def all_index
    @posts = Post.page(params[:page]).reverse_order.per(30)
    @tags = Tag.select(:name).distinct
  end

  def rank
    @posts = Kaminari.paginate_array(
      Post.find(
        Favorite.group(:post_id).
                order('count(post_id) desc').
                pluck(:post_id)
      )
    ).
      page(params[:page]).per(30)
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
      if @post.post_image_id.present?
        tags = Vision.get_image_data(@post.post_image)
        tags.each do |tag|
          @post.tags.create(name: tag)
        end
      end
      redirect_to shop_posts_path
    else
      render :new
    end
  end

  def destroy
    if @post.destroy
      redirect_to request.referer
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      @post.tags.destroy_all
      tags = Vision.get_image_data(@post.post_image)
      tags.each do |tag|
        @post.tags.create(name: tag)
      end
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
