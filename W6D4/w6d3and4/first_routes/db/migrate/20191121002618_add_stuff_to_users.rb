class AddStuffToUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
    create_table :users do |t|
      t.string :username, null: false
      t.timestamps
    end
  end
end
