class Shop::ReservationHistoriesController < ApplicationController
  before_action :authenticate_shop!, except: [:review]
  require 'csv'

  def review
    @shop = Shop.find(params[:id])
    @menus = @shop.menus.page(params[:page]).per(20)
    @reservation_histories = ReservationHistory.where(menu_id: @menus)
    @history_comments = HistoryComment.where(reservation_history_id: @reservation_histories).reverse_order
  end

  def index
    @menus = Menu.where(shop_id: current_shop)
    @reservation_histories = ReservationHistory.where(menu_id: @menus).where(menu_id: @menus).includes(:reserve).order("reserves.reservation DESC")
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_reservation_histories_csv(@reservation_histories)
      end
    end
  end

  def send_reservation_histories_csv(reservation_histories)
    csv_data = CSV.generate do |csv|
      column_names = %w(予約日時 予約者 予約メニュー メニュー金額 来店状況)
      csv << column_names

      reservation_histories.each do |history|
        column_values = [
          history.reserve.reservation.to_s(:datetime_jp) ,
          history.reserve.customer.full_name,
          history.menu.name,
          history.menu.price.to_s(:delimited),
          history.status_i18n
        ]
        csv << column_values
      end

    end
    send_data(csv_data, filename: "予約状況.csv")
  end

  def update
    @menus = Menu.where(shop_id: current_shop)
    @reservation_histories = ReservationHistory.where(menu_id: @menus)
    @reservation_history = @reservation_histories.find_by(id: params[:id])
    if @reservation_history.present?
      @reservation_history.update(reservation_history_params)
      redirect_to request.referer
    else
      redirect_to shops_histories_path
    end
  end

  private

  def reservation_history_params
    params.require(:reservation_history).permit(:status)
  end
end
