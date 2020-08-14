class Public::ReservationHistoriesController < ApplicationController

  def index
    @reservation_histories = ReservationHistory.page(params[:page]).reverse_order.per(10)
    @history_comment = HistoryComment.new
    @history_comments = HistoryComment.all
  end
end
