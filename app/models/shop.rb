class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :menus, dependent: :destroy
	has_many :posts, dependent: :destroy
  has_many :talks
  has_many :talk_rooms, through: :customer_rooms

  attachment :shop_image
  enum genre: { simple: 0, one_color: 1, foot: 2, art: 3, bridal: 4, gradation: 5 }

  def full_address
    prefecture_code + city + street + other_address
  end
end
