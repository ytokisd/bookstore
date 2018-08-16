class AddCategoriesToBooks < ActiveRecord::Migration[5.2]
    def change
      change_table :books do |t|
      t.integer :category_id
    end
    add_index :books, :category_id
  end
end
