class AddColumnToFeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :feeds, :image, :text
  end
end
