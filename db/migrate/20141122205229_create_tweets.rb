class CreateTweets < ActiveRecord::Migration
  def change
  	drop_table :tweets
    create_table :tweets do |t|
      t.string :tweet

      t.timestamps
    end
  end
end
