class Shop::ReservationHistoriesController < ApplicationController

	def index
		@reservation_histories = ReservationHistory.all.includes(:reserve).order("reserves.reservation DESC")
	end

	def update
    @reservation_history = ReservationHistory.find(params[:id])
    @reservation_history.update(reservation_history_params)
    redirect_to request.referer
	end

	private

	def reservation_history_params
    params.require(:reservation_history).permit(:status)
  end
end
