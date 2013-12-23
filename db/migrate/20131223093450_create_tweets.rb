class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.datetime :created
      t.text :text
      t.references :pattern, index: true

      t.timestamps
    end
  end
end
