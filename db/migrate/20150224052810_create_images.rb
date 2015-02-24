class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url,      null: false
      t.integer :bijo_id, null: false

      t.timestamps null: false
    end

    add_index :images, :bijo_id
  end
end
