class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
