class Public::RelationshipsController < ApplicationController
	def create
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end

  def follow
    customer = current_customer
    @following_customers = customer.following_customer.reverse_order
    @follower_customers = customer.follower_customer.reverse_order
  end
end
