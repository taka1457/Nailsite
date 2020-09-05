class ImgSearch < ApplicationRecord
  belongs_to :customer
  has_many :search_tags, dependent: :destroy
  attachment :search_image

  attr_accessor :content
end
