class Public::ReservationHistoriesController < ApplicationController

  def index
    @reservation_histories = ReservationHistory.page(params[:page]).reverse_order.per(10)
    @history_comment = HistoryComment.new
    @history_comment = HistoryComment.all
  end

  def show
    @reservation_history = reservation_history.find(params[:id])
    @history_comment = HistoryComment.new
    @history_comments = @reserve.reservation_histories.history_comments
  end
end
