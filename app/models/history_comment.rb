class HistoryComment < ApplicationRecord
  belongs_to :customer
  belongs_to :reservation_history
  validates :customer_id, uniqueness: { scope: :reservation_history_id }
end
