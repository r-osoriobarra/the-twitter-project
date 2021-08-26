class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #tweet and like relations
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy

  #follows relations
  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows, dependent: :destroy

  #custom methods
  def to_s
    self.name
  end

end
