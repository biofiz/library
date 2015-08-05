class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :book_id
      t.integer :status

      t.timestamps null: false
    end
    add_index :comments, [:user_id, :created_at]
  end
end
