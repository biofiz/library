class RemoveFullDescriptionToBooks < ActiveRecord::Migration
  def change
    remove_column :books, :short_desc, :string
    remove_column :books, :full_desc, :string
    add_column :books, :description, :string
  end
end
