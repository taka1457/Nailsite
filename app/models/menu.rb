class Menu < ApplicationRecord
  belongs_to :shop

  has_many :reservation_menus, dependent: :destroy

  attachment :menu_image
end
