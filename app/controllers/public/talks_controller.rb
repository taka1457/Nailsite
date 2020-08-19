class Public::TalksController < ApplicationController

	def show
	  @customer = Customer.find(params[:customer_id])

	  if customer_signed_in?
	  talk_rooms = current_customer.talk_rooms.pluck(:talk_room_id)
	  customer_rooms = CustomerRoom.find_by(customer_id: @customer.id, talk_room_id: talk_rooms)
		  unless customer_rooms.nil?
		    @talk_room = customer_rooms.talk_room
		  else
		    @talk_room = TalkRoom.new
		    @talk_room.save
		    CustomerRoom.create(customer_id: current_customer.id, talk_room_id: @talk_room.id)
		    CustomerRoom.create(customer_id: @customer.id, talk_room_id: @talk_room.id)
		  end
		  @talks = @talk_room.talks
		else shop_signed_in?
			@shop = current_shop
			talk_rooms = current_shop.talk_rooms.pluck(:talk_room_id)
			shop_rooms = ShopRoom.find_by(shop_id: @shop.id, talk_room_id: talk_rooms)
			unless shop_rooms.nil?
		    @talk_room = shop_rooms.talk_room
		  else
		    @talk_room = TalkRoom.new
		    @talk_room.save
		    ShopRoom.create(shop_id: current_shop.id, talk_room_id: @talk_room.id)
		    ShopRoom.create(shop_id: @shop.id, talk_room_id: @talk_room.id)
		  end
		  @talks = Talk.where(shop_id: current_shop.id).where(customer_id: @customer.id)
		end
	  @talk = Talk.new(talk_room_id: @talk_room.id)
	end

	def create
		if customer_signed_in?
			@talk = current_customer.talks.new(talk_params)
		elsif shop_signed_in?
			@talk = current_shop.talks.new(talk_params)
		end
	  @talk.save!
	  redirect_to request.referer
	end

	def index
		@talks = Talk.where(to_customer: current_customer.id).page(params[:page]).reverse_order.per(15)
	end

	private
	def talk_params
	  params.require(:talk).permit(:body, :talk_room_id, :customer_id, :contributor, :to_customer)
	end
end