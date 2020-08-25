class Genre < ApplicationRecord
  has_many :shops
  validates :name, presence: true
  validates :is_void_flag, presence: true
  attachment :genre_image
end
