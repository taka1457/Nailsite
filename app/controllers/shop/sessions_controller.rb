# frozen_string_literal: true

class Shop::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    shop_mypage_path
  end

  def after_sign_out_path_for(resource)
    new_shop_session_path
  end

  def reject_inactive_customer
    @shop = Shop.find_by(email: params[:shop][:email])
    if @shop
      if @shop.valid_password?(params[:shop][:password]) && !@shop.is_active
        flash[:danger] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
        redirect_to new_shop_session_path
      end
    end
  end
end
