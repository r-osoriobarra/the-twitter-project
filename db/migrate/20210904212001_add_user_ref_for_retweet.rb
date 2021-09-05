class AddUserRefForRetweet < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :user_rt, :integer
  end
end
