class AddFieldsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :isbn, :string
    add_column :books, :quality, :string
    add_column :books, :series, :string
    add_column :books, :short_desc, :string
    add_column :books, :full_desc, :string
    add_column :books, :image, :string
    add_column :books, :link1, :string
    add_column :books, :link2, :string
    add_column :books, :link3, :string
    add_column :books, :link4, :string
    add_column :books, :link5, :string
  end
end
