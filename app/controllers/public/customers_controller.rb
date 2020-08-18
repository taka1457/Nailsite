class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  before_action :set_current_customer, except: [:index, :show]

  def index
    @customers = Customer.page(params[:page]).per(6)
  end

  def show
    @customer = Customer.find(params[:id])
    @reservation_history = ReservationHistory.all.reverse_order
    @history_comments = HistoryComment.all
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
