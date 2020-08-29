class Shop::ShopsController < ApplicationController
  before_action :authenticate_shop!, only: [:mypage, :edit, :update, :unsubscribe, :withdraw]
  before_action :set_current_shop, only: [:mypage, :edit, :update, :unsubscribe, :withdraw]

  def index
    @genres = Genre.where(is_void_flag: true)
    @shops = Shop.page(params[:page]).per(20)
  end

  def map
    @shops = Shop.page(params[:page]).per(10)
    gon.shops = Shop.page(params[:page]).per(10)
    @genres = Genre.where(is_void_flag: true)
  end

  def search
    @shops = Shop.where(genre_id: params[:genre_id]).page(params[:page]).per(20)
    @genres = Genre.where(is_void_flag: true)
    @genre = Genre.find(params[:genre_id])
  end

  def map_search
    @shops = Shop.where(genre_id: params[:genre_id]).page(params[:page]).per(10)
    gon.shops = Shop.where(genre_id: params[:genre_id]).page(params[:page]).per(10)
    @genres = Genre.where(is_void_flag: true)
    @genre = Genre.find(params[:genre_id])
  end

  def show
    @shop = Shop.find(params[:id])
    @menus = @shop.menus.page(params[:page]).first(5)
    @posts = @shop.posts.page(params[:page]).reverse_order.first(3)
    @reservation_menu = ReservationMenu.new
  end

  def menu
    @shop = Shop.find(params[:id])
    @menus = @shop.menus.page(params[:page]).per(10)
    @reservation_menu = ReservationMenu.new
  end

  def mypage
    @genres = Genre.all
    @post = current_shop.posts
    @favorites = Favorite.where(post_id: @post)
    @post_comments = PostComment.where(post_id: @post)
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @shop.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private

  def set_current_shop
    @shop = current_shop
  end

  def shop_params
    params.require(:shop).permit(:name,
                                 :phone_number,
                                 :postal_code,
                                 :prefecture_code,
                                 :city, :street,
                                 :other_address,
                                 :traffic_method,
                                 :business_hours,
                                 :budget,
                                 :payment_method,
                                 :seat,
                                 :staff,
                                 :parking,
                                 :promotion,
                                 :introduction,
                                 :shop_image,
                                 :genre_id)
  end
end
