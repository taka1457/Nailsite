class ReservationHistory < ApplicationRecord
  belongs_to :reserve
  belongs_to :menu
end
