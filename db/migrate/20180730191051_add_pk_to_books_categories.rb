class AddPkToBooksCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :books_categories, :id, :primary_key
  end
end
