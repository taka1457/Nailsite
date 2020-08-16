class Talk < ApplicationRecord
  belongs_to :customer
  belongs_to :shop, optional: true
  belongs_to :talk_room
end
