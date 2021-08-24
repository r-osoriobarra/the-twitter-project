# Twitter.Project

Final test Milestone 1 delivery Web application development with Rails module(G46), Desafío Latam.

## Content
1. **About Twitter.Project**
    1. *Versions*
    1. *Demo*
1. **Installation**  
1. **How it works**
    1. *Conceptual model*
    1. *User model*
    1. *Tweet model*
    1. *Like model*
1. **Tools**
1. **Known bugs**


### **About Twitter.Project**
This project tries to replicate some of the most popular features of the Twitter platform, mainly the use of *Tweets*, *like / dislike* and *Retweet* actions. This is combined with a previous authentication of the user, which will have different views depending on whether it is authenticated (or not), and with the option of creating an account with its email and password.


#### *Versions*
Version 1.0 of the project. 2 more updates are expected to complete the project in the next 2 weeks.
#### *Demo*
https://the-twitter-project.herokuapp.com/

### **Installation**
  1. `git clone git@github.com:r-osoriobarra/the-twitter-project.git`
  2. `rails db:migrate`
  3. `rails db:seed`

### **How it works**
#### *Conceptual model*

This project consists of 3 main models: **User, Tweet y Like**
    - **User model**: manages all users who use the application. It is the main model to which the other models refer.
    - **Tweet model**: manages the creation and destruction of tweets. It also manages retweets in a recursive association.
    - **Like model**: manages the creation and destruction of *likes/dislikes* associated with tweets and users.

- Some of the attributes such as **n_likes or n_retweets** by normalization disappear as attributes of the Tweet model, since it is obtained from the relationship between entities.
- All models maintain a 1 to N relationship.

![Modelo conceptual](https://github.com/r-osoriobarra/ViajesChile/blob/main/assets/img/twitter_project.png)

##### *User model*
- For all user authentication, the Devise gem was used with this model.
- Relationships are 1 to N with the rest of the models (Tweet and Like)
```
    has_many :tweets, dependent: :destroy
    has_many :likes, dependent: :destroy
```
##### *Tweet model (and Retweet)*
- With their controller, handle most of the app's actions (except authentication).
- Relationship with user, like and tweet entities (recursive):
```
  #user and likes associations
  belongs_to :user
  has_many :likes, dependent: :destroy

  #recursive retweet association
  belongs_to :tweet, optional: true
  has_many :tweets, dependent: :destroy
```
- In the tweet controller, the `retweet` method is also added, which is responsible for copying the retweeted comment, identifying the` params[:id] `of the created route `post /tweets/:id, to: 'tweets#retweet'`.
  ```
  def retweet
    original_tweet = Tweet.find(params[:id])
    @tweet = Tweet.create(
      content: original_tweet.content,
      user_id: original_tweet.user_id,
      tweet_id: original_tweet.id
    )
    redirect_to root_path, notice: "Retweet was successfully created."
  end
  ```
- In the model, instance and class methods are created to obtain the number of likes and retweets for each tweet, respectively, based on the relationship with each entity, since they are not attributes of the Tweet entity:

```
 def count_likes
    self.likes.empty? ? 0 : self.likes.count
  end

  def self.count_retweets(tweet)
    Tweet.all.count {|t| t.tweet_id == tweet.id}
  end
```
##### *Like model*
- Relationship with user and tweet entities
```
    belongs_to :user
    belongs_to :tweet
```
- A controller is created for the Like entity, with `create` and `destroy` methods depending on whether a user clicks the like button. If the same user presses the like button 2 times, the created object is destroyed.
- To activate the `destroy` method that triggers a 'dislike', a method is added in the `Tweet` model, which identifies if the user has previously clicked:
    ```
    def liked?(user)
        self.likes.find_by(user_id: user.id).present?
    end
    ```
### *Tools*
    *ruby v2.7.3
    *rails v5.2.6
    *Devise gem for authentications
    *Bootstrap gem v4.6.0 for styles
    *Jquery-rails gem as bootstrap complement
    *Faker gem to generate users and tweets
    *Kaminari to paginate (every 50 tweets)

### **Known bugs**
    *Toggle does not display links in navabar
    *Tweets are not responsive to smaller screen sizes
    *N + 1 query errors

