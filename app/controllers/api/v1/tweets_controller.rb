module Api
    module V1
        class TweetsController < V1Controller

            include ActionController::HttpAuthentication::Basic::ControllerMethods
            http_basic_authenticate_with name: "superman", password: "123123", except: [:news, :by_dates]

            def news
                tweets = Tweet.last(50)
                @api_tweets = tweets.as_json(
                    only: %i[id content user_id],
                    methods: %i[like_count retweets_count retwitted_from]
                )
                render json: @api_tweets
            end

            def create_api_tweet
                @tweet = User.find(2).tweets.create(params_tweet)
                
                if @tweet.save
                    render json: @tweet, status: :created
                else
                    render json: @tweet.errors, status: :unprocessable_entity 
                end
            end

            def by_dates
                tweets = Tweet.since_date(params[:date1]).until_date(params[:date2])
                @api_tweets = tweets.as_json(
                    only: %i[id content user_id created_at],
                    methods: %i[like_count retweets_count retwitted_from]
                )
                render json: @api_tweets
            end

            private

            def params_tweet
                params.require(:tweet).permit(:content)
            end

        end
    end
end
