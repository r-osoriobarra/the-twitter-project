ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :photo, :suspended
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :name, :photo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    
    column :id
    column :name
    column :email
    column 'Following', :user do |u|
      u.followed_users.count
    end
    column 'Tweets', :user do |u|
      u.tweets.count
    end
    column 'Likes', :user do |u|
      u.likes.count
    end
    column 'Retweets', :user do |u|
      u.RT_count
    end
    column 'Suspended', :suspended
    actions
  end

end