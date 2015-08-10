class AddStatusToBooks < ActiveRecord::Migration
  def change
    change_column :books, :year, :text
    change_column :books, :pages, :text
    add_column :books, :status, :integer, default: 0, null: false
  end
end
