class AddFieldsToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :address, :string
    add_column :vendors, :city, :string
    add_column :vendors, :zip, :string
    add_column :vendors, :category, :string
    add_column :vendors, :contact, :string
    add_column :vendors, :email, :string
    add_column :vendors, :phone, :string
  end
end
