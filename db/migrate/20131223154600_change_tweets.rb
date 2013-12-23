class ChangeTweets < ActiveRecord::Migration
  def change
    change_table :tweets do |t|
      t.string :tid
    end
  end
end
