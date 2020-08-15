class Post < ApplicationRecord
  belongs_to :shop

  has_many :post_comments, dependent: :destroy

  attachment :post_image
end
