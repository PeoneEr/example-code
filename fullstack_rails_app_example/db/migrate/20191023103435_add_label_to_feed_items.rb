class AddLabelToFeedItems < ActiveRecord::Migration[6.0]
  def change
    add_column :feed_items, :label, :string
  end
end
