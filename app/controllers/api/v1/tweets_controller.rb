module Api
    module V1
        class TweetsController < V1Controller

            def index
                tweets = Tweet.all
                @api_tweets = tweets.as_json(
                    only: %i[id content user_id],
                    methods: %i[like_count retweets_count retwitted_from]
                )
                render json: @api_tweets
            end

            def by_dates
                tweets = Tweet.since_date(params[:fecha1]).until_date(params[:fecha2])
                @api_tweets = tweets.as_json(
                    only: %i[id content user_id],
                    methods: %i[like_count retweets_count retwitted_from]
                )
                render json: @api_tweets
            end
        end
    end
end
