class Public::HistoryCommentsController < ApplicationController
	def create
    @reservation_histories = ReservationHistory.page(params[:page]).reverse_order.per(10)
    @reservation_history = ReservationHistory.find(params[:reservation_history_id])
    @history_comment = @reservation_history.history_comment.new(history_comment_params)
    @history_comment.customer_id = current_customer.id
    if @history_comment.save
    else
      @reservation_history_new = Post.new
      @history_comments = @reservation_history.history_comments
    end
  end

  def destroy
    @reservation_histories = ReservationHistory.page(params[:page]).reverse_order.per(10)
    @reservation_history = ReservationHistory.find(params[:reservation_history_id])
    @history_comment = HistoryComment.find(params[:id])
    if @history_comment.customer == current_customer
      @history_comment.destroy
    end
  end

  private

  def history_comment_params
    params.require(:history_comment).permit(:body)
  end
end