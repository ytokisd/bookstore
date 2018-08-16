class RemoveIdColumnFromBooksCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column(:books_categories, :id)
  end
end
