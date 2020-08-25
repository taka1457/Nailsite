class Public::ReservationHistoriesController < ApplicationController

  def index
    @reservation_histories = ReservationHistory.all.includes(:reserve).order("reserves.reservation DESC")
    @history_comment = HistoryComment.new
    @history_comments = HistoryComment.all
  end
end
