class Public::RelationshipsController < ApplicationController
  before_action :authenticate_customer!

  def create
    current_customer.follow(params[:customer_id])
    @customer = Customer.find(params[:customer_id])
    customer = current_customer
    @following_customers = customer.following_customer.reverse_order
    @customers = Customer.where(is_active: true).page(params[:page]).per(6)
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    @customer = Customer.find(params[:customer_id])
    customer = current_customer
    @following_customers = customer.following_customer.reverse_order
    @customers = Customer.where(is_active: true).page(params[:page]).per(6)
  end

  def follow
    customer = current_customer
    @following_customers = customer.following_customer.reverse_order
    @follower_customers = customer.follower_customer.reverse_order
  end
end
