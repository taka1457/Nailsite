class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show, :rank]
  before_action :set_current_customer, except: [:index, :show, :rank]

  def index
    @customers = Customer.where(is_active: true).page(params[:page]).per(6)
  end

  def show
    @customer = Customer.where(is_active: true).find(params[:id])
    @reserves = Reserve.where(customer_id: @customer)
    @reservation_histories = ReservationHistory.where(reserve_id: @reserves)
                              .includes(:reserve)
                              .order("reserves.reservation DESC")
    @history_comments = HistoryComment.where(customer_id: @customer).reverse_order
  end

  def rank
    @first_customer = Customer.where(is_active: true).where(HistoryComment.where(id: nil))
    @customers = Kaminari.paginate_array(
                  Customer.where(is_active: true)
                    .find(HistoryComment.group(:score)
                      .order('avg(score) desc')
                      .pluck(:customer_id)))
                .page(params[:page]).per(6)
  end

  def mypage
  end

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to mypage_path, notice: '会員情報の更新が完了しました。'
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  def follows
  end

  def followers
  end

  private

  def set_current_customer
    @customer = current_customer
  end

  def customer_params
    params.require(:customer).permit(:last_name,
                                     :first_name,
                                     :first_name_kana,
                                     :last_name_kana,
                                     :email,
                                     :phone_number,
                                     :introduction,
                                     :profile_image)
  end
end
