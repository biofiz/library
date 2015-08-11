class AddStatusToBooks < ActiveRecord::Migration
  def change
    change_column :books, :year, :string
    change_column :books, :pages, :string
    add_column :books, :status, :integer, default: 0, null: false
    add_index :books, [:status, :created_at]
  end
end
