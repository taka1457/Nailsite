class shop::ReservationHistoriesController < ApplicationController

	def index
		@menus = current_shop.menus
		@reservation_histories = current_customer.menu.reservation_history.all
	end

end
