class AddLinkToFeedItems < ActiveRecord::Migration[6.0]
  def change
    add_column :feed_items, :link, :string
  end
end
