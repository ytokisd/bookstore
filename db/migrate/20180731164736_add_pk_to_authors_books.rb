class AddPkToAuthorsBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :authors_books, :id, :primary_key
  end
end
