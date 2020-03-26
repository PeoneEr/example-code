class CreateFeedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :feed_items do |t|
      t.string :title
      t.string :company
      t.string :location
      t.text :description
      t.string :salary
      t.integer :feed_id

      t.timestamps
    end
  end
end
