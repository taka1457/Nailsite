class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :reservation_menus, dependent: :destroy
  has_many :reserves, dependent: :destroy

  def full_name
    last_name + " " + first_name
  end
end
