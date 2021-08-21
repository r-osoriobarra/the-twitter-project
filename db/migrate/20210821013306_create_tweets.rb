class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :content
      t.string :user_photo
      t.integer :n_likes
      t.integer :n_retweets
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
