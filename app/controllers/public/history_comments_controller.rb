class Public::HistoryCommentsController < ApplicationController
	def create
    @reservation_history = ReservationHistory.find(params[:reservation_history_id])
    @history_comment = @reservation_history.history_comment.new(history_comment_params)
    @history_comment.customer_id = current_customer.id
    if @history_comment.save
      flash[:success] = "Comment was successfully created."
      redirect_to request.referer
    else
      @reservation_history_new = Post.new
      @history_comments = @reservation_history.history_comments
      render '/posts/show'
    end
  end

  def destroy
    @reservation_history = ReservationHistory.find(params[:reservation_history_id])
    @history_comment = HistoryComment.find(params[:id])
    if @history_comment.customer == current_customer
      @history_comment.destroy
    end
    redirect_to request.referer
  end

  private

  def history_comment_params
    params.require(:history_comment).permit(:body)
  end
end