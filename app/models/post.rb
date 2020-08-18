class Post < ApplicationRecord
  belongs_to :shop

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :post_image

  def favorited_by?(customer)
    favorites.where(customer_id: customer).exists?
  end
end
