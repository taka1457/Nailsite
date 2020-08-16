class Reserve < ApplicationRecord
  belongs_to :customer

  has_many :reservation_history, dependent: :destroy
end
