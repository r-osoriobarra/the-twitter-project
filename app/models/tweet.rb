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

  def self.liker_users(tweet_obj, users_array)

      likes_collection = tweet_obj.likes
      users_id_collection = Array.new
      
      likes_collection.each do |like|
        users_id_collection << like.user_id
      end

      likerUsers = Array.new
      users_array.each do |user|
        users_id_collection.each do |id|
          likerUsers << user if user.id == id 
        end
      end

      return likerUsers
  end
  
end