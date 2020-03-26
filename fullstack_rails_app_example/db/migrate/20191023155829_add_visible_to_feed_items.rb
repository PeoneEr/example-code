class AddVisibleToFeedItems < ActiveRecord::Migration[6.0]
  def change
    add_column :feed_items, :visible, :boolean, default: true
  end
end
