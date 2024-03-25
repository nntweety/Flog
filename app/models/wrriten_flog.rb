class WrritenFlog < ApplicationRecord

  validates :score, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
  
  validates :review, presence: true, length: {maximum: 200}
  

  belongs_to :user
  has_many :likes, dependent: :destroy
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
