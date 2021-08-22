class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes

  def liked?(user)
    self.likes.find_by(user_id: user.id).present?
  end

  def count_likes
    self.likes.empty? ? 0 : self.likes.count
  end  
end