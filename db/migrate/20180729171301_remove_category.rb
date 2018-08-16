class RemoveCategory < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :category
    remove_column :books, :category_id
  end
end
