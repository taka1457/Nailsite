class CustomerRoom < ApplicationRecord
  belongs_to :customer
  belongs_to :talk_room
end
