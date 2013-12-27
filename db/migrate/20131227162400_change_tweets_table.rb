class ChangeTweetsTable < ActiveRecord::Migration
  def change
    remove_column :tweets, :pattern_id

    change_table :tweets do |t|
      t.integer :user_id
    end
  end
end
