class Like < ApplicationRecord
    belongs_to :user
    belongs_to :tweet
    validates :user_id, uniqueness: {scope: :tweet_id}
    #ver que como explicar lo del scope
end