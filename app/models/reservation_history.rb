class ReservationHistory < ApplicationRecord
  belongs_to :reserve
  belongs_to :menu

  has_many :history_comment, dependent: :destroy
end
