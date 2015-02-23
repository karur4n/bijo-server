class CreateBijos < ActiveRecord::Migration
  def change
    create_table :bijos do |t|
      t.string :name,            null: false
      t.datetime :referenced_at, null: false

      t.timestamps null: false
    end

    add_index :bijos, :name, unique: true
  end
end
