class Tweet < ApplicationRecord
  
  belongs_to :user
  has_many :likes, dependent: :destroy

  belongs_to :original_tweet, optional: true
  has_many :retweets, dependent: :destroy

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