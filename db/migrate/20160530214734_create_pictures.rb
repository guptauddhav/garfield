class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :pictures, :user_id
  end
end