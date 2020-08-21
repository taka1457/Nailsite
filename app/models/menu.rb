class Menu < ApplicationRecord
  belongs_to :shop

  has_many :reservation_menus, dependent: :destroy
  has_many :reservation_history, dependent: :destroy

  validates :name, presence: true, length: { maximum: 36}
  validates :detail, length: { maximum: 50}
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }

  attachment :menu_image
end
