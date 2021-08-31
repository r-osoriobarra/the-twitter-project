# Twitter.Project

Final test Milestone 2 delivery Web application development with Rails module(G46), Desafío Latam.

## Content
1. **About Twitter.Project**
    1. *Versions*
    1. *Demo*
1. **Installation**  
1. **How it works**
    1. *Conceptual model*
1. **Tools**
1. **Known bugs**


### **About Twitter.Project**
This project tries to replicate some of the most popular features of the Twitter platform, mainly the use of *Tweets*, *like / dislike* and *Retweet* actions. This is combined with a previous authentication of the user, which will have different views depending on whether it is authenticated (or not), and with the option of creating an account with its email and password.


#### *Versions*
- Version 1.0 of the project. 2 more updates are expected to complete the project in the next 2 weeks.
- **Update 1.1v:** adding new features as hashtag functions, tweets search-bar, follows and admin-panel.
#### *Demo*
- `https://the-twitter-project.herokuapp.com/`

- *for admins*
- `https://the-twitter-project.herokuapp.com/admin`
    - email: `admin@mail.com`
    - password: `123123`

### **Installation**
  1. `git clone git@github.com:r-osoriobarra/the-twitter-project.git`
  2. `rails db:migrate`
  3. `rails db:seed`

### **How it works**
#### *Conceptual model*

This project consists of 3 main models: **User, Tweet y Like**
    - **User model (update 1.1v)**: manages all users who use the application. It is the main model to which the other models refer. In 1.1v it was implemented a (N:N) recursive association to manage *Follower/Followed* functions and Follow model as well.
    - **Tweet model**: manages the creation and destruction of tweets. It also manages retweets in a recursive association.
    - **Like model**: manages the creation and destruction of *likes/dislikes* associated with tweets and users.
    - **Follow model (update 1.1v)**: manages the relation between users when "follow" each other.

- Some of the attributes such as **n_likes or n_retweets** by normalization disappear as attributes of the Tweet model, since it is obtained from the relationship between entities.
- All models maintain a 1 to N relationship, except User recursive association, which is (N:N) **(update 1.1v)**

![Modelo conceptual](https://github.com/r-osoriobarra/ViajesChile/blob/main/assets/img/twitter_project.png)

### *Tools*
    *ruby v2.7.3
    *rails v5.2.6
    *Devise gem for authentications
    *Bootstrap gem v4.6.0 for styles
    *Jquery-rails gem as bootstrap complement
    *Faker gem to generate users and tweets
    *Kaminari gem to paginate (every 50 tweets)
    *Admin active gem for Admin user

### **Known bugs**
    *Toggle does not display links in navabar
    *Tweets are not responsive to smaller screen sizes
    *N + 1 query errors

