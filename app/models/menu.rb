class Menu < ApplicationRecord
  belongs_to :shop

  attachment :menu_image
end
