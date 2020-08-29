class Shop::MenusController < ApplicationController
  before_action :authenticate_shop!
  before_action :ensure_menu, only: [:edit, :update, :destroy]

  def index
    @menus = current_shop.menus.page(params[:page]).per(5)
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.shop_id = current_shop.id
    if @menu.save
      redirect_to shop_menus_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to shop_menus_path
    else
      render :edit
    end
  end

  def destroy
    @menu.destroy
    redirect_to request.referer
  end

  private

  def ensure_menu
    @menus = current_shop.menus
    @menu = @menus.find_by(id: params[:id])
    unless @menu
      redirect_to shop_menus_path(current_shop)
    end
  end

  def menu_params
    params.require(:menu).permit(:name,
                                 :detail,
                                 :price,
                                 :menu_image)
  end
end
