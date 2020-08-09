class Shop::MenusController < ApplicationController

  def index
  	@menus = Menu.page(params[:page])
  end

  def new
  	@menu = Menu.new
  end

	def create
		@menu = Menu.new(menu_params)
  	@menu.shop_id = current_shop.id
  	@menu.save
  	redirect_to menus_path
  end
  def destroy
  	@menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to request.referer
  end

  def edit
  	@menu = Menu.find(params[:id])
  end

  def update
  	menu = Menu.find(params[:id])
    menu.update(menu_params)
    redirect_to menus_path
  end

  private
  def menu_params
  	params.require(:menu).permit(:name,
																 :detail,
																 :price,
																 :menu_image)
  end
end
