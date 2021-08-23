class Tweet < ApplicationRecord
  #kaminari pagination
  paginates_per 50

  #user and likes associations
  belongs_to :user
  has_many :likes, dependent: :destroy

  #recursive retweet association
  belongs_to :tweet, optional: true
  has_many :tweets, dependent: :destroy

  #validations
  validates :content, presence: true
  #custom methods
  def liked?(user)
    self.likes.find_by(user_id: user.id).present?
    #ver si existe un error con esta sentencia
  end

  def count_likes
    self.likes.empty? ? 0 : self.likes.count
  end

  def self.count_retweets(tweet)
    Tweet.all.count {|t| t.tweet_id == tweet.id}
  end

end