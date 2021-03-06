class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :genre
  has_many :menus, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :shop_rooms
  has_many :talks
  has_many :talk_rooms, through: :shop_rooms
  has_many :bookmarks, dependent: :destroy

  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :prefecture_code, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :other_address, length: { maximum: 40 }
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :budget, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :seat, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :staff, presence: true, format: { with: /\A[0-9]+\z/ }
  validates :traffic_method, presence: true, length: { maximum: 200 }
  validates :payment_method, presence: true, length: { maximum: 100 }
  validates :business_hours, presence: true, length: { maximum: 100 }
  validates :parking, presence: true, length: { maximum: 20 }
  validates :promotion, presence: true, length: { maximum: 50 }
  validates :introduction, presence: true, length: { maximum: 150 }
  validates :genre_id, presence: true

  attachment :shop_image


  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

  def full_address
    if other_address.present?
      prefecture_code + city + street + other_address
    else
      prefecture_code + city + street
    end
  end
end
