class RemoveLastOffsetFromFeeds < ActiveRecord::Migration[6.0]
  def change
    remove_column :feeds, :last_offset
  end
end
