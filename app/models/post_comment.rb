class PostComment < ApplicationRecord
  belongs_to :customer
  belongs_to :post

  validates :body, presence: true, length: { maximum: 140}
end
