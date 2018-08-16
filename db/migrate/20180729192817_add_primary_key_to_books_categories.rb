class AddPrimaryKeyToBooksCategories < ActiveRecord::Migration[5.2]
  def change
      change_table :books_categories do |t|
        t.integer :id
      end
       execute "ALTER TABLE books_categories ADD PRIMARY KEY (id);"
  end
end
