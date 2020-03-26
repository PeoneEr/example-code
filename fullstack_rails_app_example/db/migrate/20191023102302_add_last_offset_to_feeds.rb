class AddLastOffsetToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :last_offset, :integer, default: 0
  end
end
