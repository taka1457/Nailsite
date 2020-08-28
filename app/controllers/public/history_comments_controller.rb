class Public::HistoryCommentsController < ApplicationController
  before_action :authenticate_customer!

  def create
    @reservation_histories = ReservationHistory.all.includes(:reserve).order("reserves.reservation DESC")
    @reservation_history = ReservationHistory.find(params[:reservation_history_id])
    @history_comment = @reservation_history.history_comment.new(history_comment_params)
    @history_comment.customer_id = current_customer.id
    if @history_comment.save
      redirect_back(fallback_location: customer_reservation_histories_path(current_customer.id))
    else
      redirect_back(fallback_location: customer_reservation_histories_path(current_customer.id))
    end
  end

  def destroy
    @reservation_histories = ReservationHistory.all.includes(:reserve).order("reserves.reservation DESC")
    @reservation_history = ReservationHistory.find(params[:reservation_history_id])
    @history_comment = HistoryComment.find(params[:id])
    if @history_comment.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def history_comment_params
    params.require(:history_comment).permit(:body)
  end
end
