class ShopRoom < ApplicationRecord
  belongs_to :shop
  belongs_to :talk_room
end
