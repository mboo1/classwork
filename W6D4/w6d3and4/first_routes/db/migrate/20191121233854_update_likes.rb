class UpdateLikes < ActiveRecord::Migration[5.2]
  def change
    drop_table :likes
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.references :likeable, polymorphic: true
      t.timestamps
    end
  end
end
