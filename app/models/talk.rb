class Talk < ApplicationRecord
  belongs_to :customer
  belongs_to :shop
  belongs_to :talk_room
end
