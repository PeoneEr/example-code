class AddParsedToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :parsed, :boolean, default: false
  end
end
