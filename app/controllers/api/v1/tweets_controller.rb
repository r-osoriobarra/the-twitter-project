module Api
    module V1
        class TweetsController < V1Controller
            def index
                tweets = Tweet.all
                @tweets = tweets.as_json(
                    only: %i[id content user_id],
                    methods: %i[like_count retweets_count retwitted_from]
                )
                render json: @tweets
            end
        end
    end
end
