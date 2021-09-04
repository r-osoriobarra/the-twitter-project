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
  #use of like button
  def liked?(user)
    self.likes.find_by(user_id: user.id).present?
  end

  #likes count
  def like_count
    self.likes.empty? ? 0 : self.likes.count
  end
  
  #RT count
  def retweets_count
    retweets = Tweet.all.count {|tweet| tweet.tweet_id == self.id}
  end
  
  #users who retweet count
  def retwitted_from
    
    #tweet_ids = Tweet.all.where(:tweet_id == self.id)
    #crear una varible para el modelo tweet que guarde el usuario que retweetea.
    #Actualmente estoy reemplazando el user_id del retweet como el del user original
    #crear una variable que guarde ambos en el moelode tweet. 

  end

  #users who likes a tweet
  def self.liker_users(tweet_obj, users_array)
      
      #obtain an array with user_id relationed with the tweet
      likes_collection = tweet_obj.likes
      users_id_collection = Array.new
      
      likes_collection.each do |like|
        users_id_collection << like.user_id
      end

      #obtain an array with users objects relationed with the tweet and likes
      likerUsers = Array.new
      users_array.each do |user|
        users_id_collection.each do |id|
          likerUsers << user if user.id == id 
        end
      end

      return likerUsers
  end


end