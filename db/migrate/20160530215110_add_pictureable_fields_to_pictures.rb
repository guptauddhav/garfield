class AddPictureableFieldsToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :pictureable_id, :integer
    add_index :pictures, :pictureable_id
    add_column :pictures, :pictureable_type, :string
    add_index :pictures, :pictureable_type
  end
end
