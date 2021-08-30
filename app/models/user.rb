class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #tweet and like relations
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  #follows relations
  #followed side
  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows

  #follower side
  has_many :inverse_follows, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed_users, through: :inverse_follows, source: :user

  #custom methods
  def to_s
    self.name
  end

  def self.followed_list(user) #TODO metodo provisional para encontrar usuarios a los  que sigo
    user.followed_users
  end

  def RT_count
    self.tweets.count {|tweet| !tweet.tweet_id.nil?}
  end

end


