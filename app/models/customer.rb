class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :reservation_menus, dependent: :destroy
  has_many :reserves, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :history_comment, dependent: :destroy
  has_many :customer_rooms
  has_many :talks
  has_many :talk_rooms, through: :customer_rooms
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_customer, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_customer, through: :followed, source: :follower # 自分をフォローしている人

  def follow(customer_id)
    follower.create(followed_id: customer_id)
  end
  # ユーザーのフォローを外す
  def unfollow(customer_id)
    follower.find_by(followed_id: customer_id).destroy
  end
  # フォローしていればtrueを返す
  def following?(customer)
    following_customer.include?(customer)
  end

  def full_name
    last_name + " " + first_name
  end
end
