class Reserve < ApplicationRecord
  belongs_to :customer

  has_many :reservation_histories, dependent: :destroy
end
