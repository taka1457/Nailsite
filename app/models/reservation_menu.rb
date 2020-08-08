class ReservationMenu < ApplicationRecord
  belongs_to :customer
  belongs_to :menu
end
