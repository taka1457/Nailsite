class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Customer"
  belongs_to :followed, class_name: "Customer"
  validates :followed, uniqueness: { scope: :followed_id }
end
