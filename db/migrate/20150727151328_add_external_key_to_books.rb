class AddExternalKeyToBooks < ActiveRecord::Migration
  def change
    add_column :books, :user_id, :integer
    add_index :books, [:user_id, :created_at]
  end
end
