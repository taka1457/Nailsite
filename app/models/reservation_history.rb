class ReservationHistory < ApplicationRecord
  belongs_to :reserve
  belongs_to :menu

  has_many :history_comment, dependent: :destroy

  enum status: { booking: 0, done: 1, cancel: 2, unauthorized: 3 }
end
