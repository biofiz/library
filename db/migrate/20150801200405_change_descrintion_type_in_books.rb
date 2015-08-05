class ChangeDescrintionTypeInBooks < ActiveRecord::Migration
  def change
    remove_column :books, :description, :string
    add_column :books, :description, :text
  end
end
