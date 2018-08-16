class AddPrimaryKeyToAuthorsBooks < ActiveRecord::Migration[5.2]
  def change
    change_table :authors_books do |t|
      t.integer :id
    end
     execute "ALTER TABLE authors_books ADD PRIMARY KEY (id);"
  end
end
