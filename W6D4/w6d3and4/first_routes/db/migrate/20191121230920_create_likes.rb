class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :like_id
      t.string :likeable_type
      t.timestamps
    end

    add_index :likes, :user_id
    add_index :likes, [:likeable_type, :like_id], unique: true
  end
end