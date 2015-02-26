class AddCrawledAtToBijos < ActiveRecord::Migration
  def change
    add_column :bijos, :crawled_at, :datetime
    change_column :bijos, :crawled_at, :datetime, null: false
  end
end
