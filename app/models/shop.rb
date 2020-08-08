class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :shop_image
  enum genre: { simple: 0, one_color: 1, foot: 2, art: 3, bridal: 4, gradation: 5 }

end
