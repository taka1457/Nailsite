class Shop::TalksController < ApplicationController

	def index
		@talks = Talk.where(shop_id: current_shop.id).page(params[:page]).reverse_order.per(50)
		@sends = Talk.where(shop_id: current_shop.id, contributor: 'shop').page(params[:page]).reverse_order.per(50)
	end

	def show
	  @shop = Shop.find(params[:shop_id])
	  @customer = current_customer
	  talk_rooms = @shop.talk_rooms.pluck(:talk_room_id)
		shop_rooms = ShopRoom.find_by(shop_id: @shop.id, talk_room_id: talk_rooms)
	  @talk_room = shop_rooms.talk_room
	  @talks = Talk.where(shop_id: @shop.id).where(customer_id: current_customer)
	  @talk = Talk.new(talk_room_id: @talk_room.id)
	end

	def create
		@talk = current_customer.talks.new(talk_params)
	  @talk.save!
	  redirect_to request.referer
	end

	private
	def talk_params
	  params.require(:talk).permit(:body, :talk_room_id, :customer_id ,:shop_id)
	end
end
