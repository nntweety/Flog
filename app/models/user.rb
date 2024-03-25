class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :introduction, length: {maximum: 100}

  def active_for_authentication?
    super && (is_active == true)
  end


  def follow_set(user_id)
    follow.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follow.find_by(followed_id: user_id).destroy
  end

  def following?(user_id)
    followings.include?(user_id)
  end

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true

  attachment :image
  has_many :wrriten_flogs, dependent: :destroy
  has_many :my_lists, dependent: :destroy
  has_many :likes, dependent: :destroy

  # has_manyでメソッド化している。defのようなもの

  has_many :follow, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy

  has_many :followings, through: :follow, source: :followed
  has_many :followers, through: :follow, source: :follower

end
