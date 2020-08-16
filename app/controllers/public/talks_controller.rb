class Public::TalksController < ApplicationController

	def show
	  @customer = Customer.find(params[:id])
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
	end
	def create
	  @talk = current_customer.talks.new(talk_params)
	  @talk.save!
	end

	private
	def talk_params
	  params.require(:talk).permit(:body, :talk_room_id)
	end
end