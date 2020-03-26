class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :search_query
      t.string :search_region
      t.belongs_to :user

      t.timestamps
    end
  end
end
