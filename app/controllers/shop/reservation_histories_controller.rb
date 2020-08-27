class Shop::ReservationHistoriesController < ApplicationController
  before_action :authenticate_shop!

  def index
    @menus = Menu.where(shop_id: current_shop)
    @reservation_histories = ReservationHistory.where(menu_id: @menus).includes(:reserve).order("reserves.reservation DESC")
  end

  def update
    @menus = Menu.where(shop_id: current_shop)
    @reservation_histories = ReservationHistory.where(menu_id: @menus)
    @reservation_history = @reservation_histories.find_by(id: params[:id])
    if @reservation_history.present?
      @reservation_history.update(reservation_history_params)
      redirect_to request.referer
    else
      redirect_to shops_histories_path
    end
  end

  private

  def reservation_history_params
    params.require(:reservation_history).permit(:status)
  end
end
