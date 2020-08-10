class Shop::ShopsController < ApplicationController
  before_action :authenticate_shop!, except: [:index, :show, :menu]
	before_action :set_current_shop, except: [:index, :show, :menu]

  def index
    @shops = Shop.page(params[:page])
  end

  def show
    @shop = Shop.find(params[:id])
    @menus = @shop.menus.page(params[:page]).first(5)
    @posts = @shop.posts.page(params[:page]).reverse_order.first(3)
  end

  def menu
    @shop = Shop.find(params[:id])
    @menus = @shop.menus.page(params[:page])
  end

	def mypage
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
    														 :genre)
  end
end
