class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :title
      t.string :pattern

      t.timestamps
    end
  end
end
