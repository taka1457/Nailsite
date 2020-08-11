class Post < ApplicationRecord
  belongs_to :shop

  attachment :post_image
end
