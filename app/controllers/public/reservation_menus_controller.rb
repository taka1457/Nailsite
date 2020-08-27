class Public::ReservationMenusController < ApplicationController
  before_action :authenticate_customer!

  def index
    @reservation_menus = current_customer.reservation_menus
  end

  def create
    current_customer.reservation_menus.destroy_all
    reservation_menu = ReservationMenu.new(reservation_menu_params)
    reservation_menu.customer_id = current_customer.id
    reservation_menu.save
    redirect_to reservation_menus_path
  end

  private

  def reservation_menu_params
    params.require(:reservation_menu).permit(:menu_id, :reservation_shop)
  end
end
