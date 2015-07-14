class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string  :name
      t.string  :author
      t.string  :publisher
      t.integer :year
      t.string  :language
      t.string  :extension
      t.string  :size
      t.integer :pages

      t.timestamps null: false
    end
  end
end
