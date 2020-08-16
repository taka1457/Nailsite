class HistoryComment < ApplicationRecord
  belongs_to :customer
  belongs_to :reservation_history
end
