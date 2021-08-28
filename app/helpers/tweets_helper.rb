module TweetsHelper
    def hashtag(content)
        tweet_words = content.split(" ")
        tag = []
        tweet_words.each do |word|
            if word.start_with?("#")
                word = link_to word, controller: 'tweets', q: word
            end
            tag << word
        end
        raw tag.join(" ")
    end
end
