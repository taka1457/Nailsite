class Public::ReservesController < ApplicationController

	def new
		@reserve = Reserve.new
	end

	def confirm
    @reserve = Reserve.new(reserve_params)
    @reserve.customer = current_customer
    @reservation_menus = current_customer.reservation_menus.all
    @reserve.reservation_date = @reserve.reservation_date
    @reserve.reservation_time = @reserve.reservation_time
  end

  def create
    @reserve = Reserve.new(reserve_params)
    @reserve.customer = current_customer
    if @reserve.save!
      @reservation_menus = current_customer.reservation_menus.all
      @reservation_menus.destroy_all
      redirect_to reserves_done_path
    else
      render 'confirm'
    end
  end

  private

  def reserve_params
    params.require(:reserve).permit(:customer_id,
    																:reservation_date,
    																:reservation_time)
  end
end