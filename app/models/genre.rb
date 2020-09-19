class Genre < ApplicationRecord
  has_many :shops
  validates :name, presence: true
  validates :is_void_flag, inclusion: { in: [true, false] }
  attachment :genre_image
end