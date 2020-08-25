class Public::ReservesController < ApplicationController
  before_action :authenticate_customer!

	def new
		@reserve = Reserve.new
	end

	def confirm
    @reserve = Reserve.new(reserve_params)
    @reserve.customer = current_customer
    @reservation_menus = current_customer.reservation_menus.all
  end

  def create
    @reserve = Reserve.new(reserve_params)
    @reserve.customer = current_customer
    if @reserve.save!
      @reservation_menus = current_customer.reservation_menus.all
      @reservation_menus.each do |reservation_menu|
        reservation_history = ReservationHistory.new
        reservation_history.reserve_id = @reserve.id
        reservation_history.menu_id = reservation_menu.menu.id
        reservation_history.reservation_price = reservation_menu.menu.price
        reservation_history.save!
      end
      @reservation_menus.destroy_all
      redirect_to reserves_done_path
    else
      render 'confirm'
    end
  end

  private

  def reserve_params
    params.require(:reserve).permit(:customer_id,:reservation)
  end
end