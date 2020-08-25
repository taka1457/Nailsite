class Public::TalksController < ApplicationController
	before_action :authenticate_customer!, only: [:index]

	def show
	  if customer_signed_in?
		  @customer = Customer.find(params[:customer_id])
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
		  @talk = Talk.new(talk_room_id: @talk_room.id)
		elsif shop_signed_in?
			@customer = Customer.find(params[:customer_id])
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
		  @talk = Talk.new(talk_room_id: @talk_room.id)
		else
			redirect_to new_customer_session_path
		end
	end

	def create
		if customer_signed_in?
			@talk = current_customer.talks.new(talk_params)
			@talk.save!
	  	redirect_to request.referer
		elsif shop_signed_in?
			@talk = current_shop.talks.new(talk_params)
			@talk.save!
	  	redirect_to request.referer
	  else
	  	redirect_to new_customer_session_path
		end
	end

	def index
		@talks = Talk.where(to_customer: current_customer.id).page(params[:page]).reverse_order.per(15)
	end

	private
	def talk_params
	  params.require(:talk).permit(:body, :talk_room_id, :customer_id, :contributor, :to_customer)
	end
end