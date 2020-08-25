class ReservationHistory < ApplicationRecord
  belongs_to :reserve
  belongs_to :menu

  has_many :history_comment, dependent: :destroy

  enum status: { confirm: 0, booking: 1, done: 2, cancel: 3, unauthorized: 4 }
end
