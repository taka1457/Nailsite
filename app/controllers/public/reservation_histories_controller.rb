class Public::ReservationHistoriesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @reserves = Reserve.where(customer_id: current_customer)
    @reservation_histories = ReservationHistory.where(reserve_id: @reserves).includes(:reserve).order("reserves.reservation DESC")
    @history_comment = HistoryComment.new
    @history_comments = HistoryComment.all
    @total_score = @reservation_histories.sum(:score)
  end
end
